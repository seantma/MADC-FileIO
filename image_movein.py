# Progress fMRI data move in script 
#
# Sean Ma, Jan 31, 2017

import os
import re
import pandas as pd
import logging

# change working directory
# os.chdir('/home/tehsheng/Projects/Progress_Analysis/Data_MoveIn/')
os.chdir('/net/dysthymia/tehsheng/projects/Progress_Analysis/Data_MoveIn/')

# read in QC_Progress.csv sheet to serve as 
df = pd.read_csv('QC_Progress_DataLink_CompleteTaskLogs.csv')
# df = pd.read_csv('test_QC_Progress_DataLink_CompleteTaskLogs.csv')
# df.head(5)

# # displaying the column of interest
# df['Task_Sequence']

# # some interesting pandas manipulation
# df['Study_ID'].sort_values()[0:5]       # sorting values
# df.ix[0, 0:5]                           # first 5 columns of 1st row
# df.columns                              # column names
# list(zip(df.columns, [type(x) for x in df.ix[0,:]]))    # data types for each column
# df.dtypes                               # pandas way for data type

# setting up logging settings
log = logging.getLogger()
log.setLevel(logging.DEBUG)
fh = logging.FileHandler(filename='server_movein.log')
fh.setLevel(logging.DEBUG)
formatter = logging.Formatter(
                fmt='%(asctime)s %(levelname)s: %(message)s',
                datefmt='%Y-%m-%d %H:%M:%S'
                )
fh.setFormatter(formatter)
log.addHandler(fh)
#log.info('this fucntion is finished')

# logic for moving data
# don't traverse the directory
# for agreed folders, process as normal
# for no-agreed folders, annotate on processed folder as "_needAttention"
# 

# where to find source nii files and where to put them
# source_directory = '/home/tehsheng/Desktop/Progress_Analysis/AllSubjectData.sim'
# target_directory = '/home/tehsheng/Desktop/Progress_Analysis/Subjects.sim'
source_directory = '/net/data2/PROGrESS2016/AllSubjectData'
target_directory = '/net/data2/PROGrESS2016/Subjects'

# dictionary for task name in Task_Sequence
dicTask = {'SEAT':'SEAT', 'EFAT':'EFAT', 'R':'Resting', 'MV':'MotorVisual', 'ERT':'ERT'}

# function for linking anatomicals/functionals for each subject
# should use logging to log all changes to file directory
def linkfiles(subject, task_lst, task_num, func_agree, tot_anat):
    
    # change to target directory
    os.chdir(target_directory)
         
    # linking functional files
    if func_agree == 'Yes':
        
        # make suject's folder and change to it
        try:
            os.mkdir(subject)   # should i use os.makedirs(subject/anatomy) to create multiple folders at once?
            os.chdir(subject)
        
        except FileExistsError:
            log.error('Subject folder already exists for subject: %s', subject)
            
        # for each subject, cycle thru taskslist: create folders; link functionals
        for (idx, tsk) in enumerate(taskslist_lst):
            
            # create task directory from the dicTask dictionary, like "Resting" for "R"
            task_dir = dicTask.get(tsk)
            os.mkdir(task_dir)
            os.chdir(task_dir)
            
            # func folder starting number
            funcStartNo = sum(task_num[:idx]) + 1
            
            # start linking functional runs without /func folder
            for run_no in range(1, task_num[idx]+1):
                
                # setup original run file pathway
                orig_run_no = funcStartNo + run_no - 1
                #source_runfile = 'TASK/func/run_0' + str(orig_run_no) + '.nii'
                #source = source_directory + '/' + subject + source_runfile
                source_runfile = 'run_0' + str(orig_run_no) + '.nii'
                source = os.path.join(source_directory, subject, 'TASK', 'func', source_runfile)
                log.info('Original run file: {}'.format(source))
                
                # setup target run file pathway
                target_runfile = 'run_0' + str(run_no) + '.nii'
                #target = target_directory + '/' + subject + '/' +
                target = os.path.join(target_directory, subject, task_dir, target_runfile)
                log.info('Target run file: {}'.format(target))
                
                # symlink source and target 
                # subprocess.run("ln -s " + original_location + "run_" + run_no + ".nii", shell=TRUE)
                try: 
                    os.symlink(source, target)
                    log.info('Successfully linked subject: %s for task: %s run_0%d.nii from original run_%d.nii', subject, tsk, run_no, orig_run_no)
                
                except (FileNotFoundError, OSError):
                    log.error('File does not exist! Please check subject: %s , task: %s, run_%d.nii', subject, tsk, run_no)
                    
            # change directory to subject level
            os.chdir(os.path.join(target_directory, subject))
    
    elif func_agree == 'No':
        # annotate subject folder 
        # os.mkdir(subject + '.func_runs_not_match')    # this causes error for anatomy section below
        os.mkdir(subject)
        log.error('Functional runs not matching between server and log for: %s', subject)
    
    else:
        log.error('No functional runs for subject: %s', subject)
    
    # anatomical link: even if total_anatomy > 3 
    if tot_anat == 3:
        
        # first make /anatomy in subject folder; doesn't need to chdir into it
        os.mkdir(os.path.join(target_directory, subject, 'anatomy'))
        
        # try link up anatomical files
        try:
            # link up t1spgr.nii
            src_spgr = os.path.join(source_directory, subject, 'anatomy', 'HIRESAXIAL.nii')
            tar_spgr = os.path.join(target_directory, subject, 'anatomy', 't1spgr.nii')
            os.symlink(src_spgr, tar_spgr)
            log.info('Successfully linked t1spgr for subject: %s from %s', subject, src_spgr)
            
            # link up t1overlay.nii
            src_over = os.path.join(source_directory, subject, 'anatomy', 'OVERLAY.nii')
            tar_over = os.path.join(target_directory, subject, 'anatomy', 't1overlay.nii')
            os.symlink(src_over, tar_over)
            log.info('Successfully linked t1spgr for subject: %s from %s', subject, src_over)
        
        except (FileNotFoundError, OSError):
            log.error('Anatomical images failed to link for subject: %s', subject)
    
    return
    
# function for the main processing - looping over subject directories    
for subject in df['fMRI_ID']:
    
    # initating variables
    tasks = None
    taskslist = None
    taskslist_num = None
    taskslist_lst = None
    func_agree = None
    tot_anat = None
    
    # check subject directory first, if exist, run linkfiles() function, if not, log as info
    if os.path.isdir(os.path.join(source_directory, subject)):
        
        # index tasks from Task_Sequence
        try:
            tasks = df[df.fMRI_ID == subject].Task_Sequence.item()
        except ValueError:
            log.error('Cannot convert Task_Sequence to scalar for subject: %s', subject)
        
        # split the tasks into a list of list including task & number string using re.findall()
        taskslist = [re.findall('(\d+|\D+)', t) for t in tasks.split('_')]
        
        # change the string for task number to digit while creating 2 new list separating tasks and numbers
        taskslist_num = [ int(i[1]) for i in taskslist ]
        taskslist_lst = [ i[0] for i in taskslist ]
        
        # index agreement logic whether server and csv logsheet match
        func_agree = df[df.fMRI_ID == subject].func_agree.item()
        
        # index total anatomy counts
        tot_anat = int(df[df.fMRI_ID == subject].total_anatomy.item())
        
        # NOW!! start linking files for subject
        linkfiles(subject, taskslist_lst, taskslist_num, func_agree, tot_anat)
        
    else:
        # make and annotate subject directory that it needs transfer
        os.chdir(target_directory)
        os.mkdir(subject + '.needs_data_transfer')
        log.warning('Subject directory not found for: {}'.format(subject))

# shutting down logging system and handler
log.removeHandler(fh)
del log,fh
    
# add in main()??



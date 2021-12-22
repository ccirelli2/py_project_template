""" Module to run pylint as pre-commit.  If score < threshold then              
    raise exception.                                                            
"""                                                                             
import sys                                                                      
import argparse                                                                 
import logging                                                                  
from pylint.lint import Run                                                     
                                                                                
                                                                                
logging.getLogger().setLevel(logging.INFO)                                      
                                                                                
parser = argparse.ArgumentParser(prog="LINT")                                   
                                                                                
parser.add_argument(                                                            
    "-p",                                                                       
    "--path",                                                                   
    help="path to directory you want to run pylint | "                          
    "Default: %(default)s | "                                                   
    "Type: %(type)s ",                                                          
    default="./src",                                                            
    type=str,                                                                   
)                                                                               
                                                                                
parser.add_argument(                                                            
    "-t",                                                                       
    "--threshold",                                                              
    help="score threshold to fail pylint runner | "                             
    "Default: %(default)s | "                                                   
    "Type: %(type)s ",                                                          
    default=7,                                                                  
    type=float,                                                                 
)                                                                               
                                                                                
args = parser.parse_args()                                                      
PATH_NAME = str(args.path)                                                      
threshold = float(args.threshold)                                               
                                                                                
logging.info(                                                                   
    "PyLint Starting | "                                                        
    "Path: {} | "                                                               
    "Threshold: {} ".format(PATH_NAME, threshold)                               
)                                                                               
                                                                                
results = Run([PATH_NAME], do_exit=False)                                       
final_score = results.linter.stats.__dict__["global_note"]   

# final_score = results.linter.stats["global_note"]                             
                                                                                
if final_score >= threshold:                                                    
    RETURN_MESSAGE = (                                                          
        "PyLint Passed | "                                                      
        "Score: {} | "                                                          
        "Threshold: {} ".format(final_score, threshold)                         
    )                                                                           
                                                                                
    logging.info(RETURN_MESSAGE)                                                
                                                                                
    sys.exit(0)                                                                 
                                                                                
else:                                                                           
    RETURN_MESSAGE = (                                                          
        "PyLint Failed | "                                                      
        "Score: {} | "                                                          
        "Threshold: {} ".format(final_score, threshold)                         
    )                                                                           
                                                                                
    logging.error(RETURN_MESSAGE)                                               
    raise Exception(RETURN_MESSAGE)      

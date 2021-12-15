#!/usr/bin/env python
# coding: utf-8

# In[35]:


def bp_systolic_check():
    systolic = int(input('Please enter your systolic pressure: '))
    BP_STATUS = systolic
    if BP_STATUS <= 89:
        Result = "Low"
    elif 90 <= BP_STATUS <= 119:
        Result = "Ideal"
    elif 120 <= BP_STATUS <= 139:
        Result = "Warning"
    elif 140 <= BP_STATUS <= 159:
        Result = "High"
    else:
        return print("Emergency {} is far too high!\nPlease seek medical attention!!! ".format(BP_STATUS))
    print("{} is your systolic pressure.\nThis indicates {} blood pressure".format(BP_STATUS, Result))


# In[38]:


bp_systolic_check()


# In[ ]:





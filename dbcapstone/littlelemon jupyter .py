#!/usr/bin/env python
# coding: utf-8

# In[1]:


get_ipython().system('pip install mysql-connector-python')


# In[2]:


import mysql.connector as connector


# In[6]:


connection = connector.connect(user = "root",password = "etima7538",db ="littlelemondm")


# In[10]:


cursor = connection.cursor()


# In[12]:


show_tables_query = "SHOW tables"


# In[20]:


cursor.execute("USE show_tables_query")


# In[ ]:





# In[ ]:





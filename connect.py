import sonic


ipfile = {'10.27.201.1':'MLAG271.json','10.27.201.2':'MCLAG272.json',
          '10.27.201.5':'MCLAG275.json', '10.27.201.42':'MCLAG42.json',
                   }

con = sonic.sonic(ipfile)
#con.con_switch()
val = con.check_switch()
print(val)



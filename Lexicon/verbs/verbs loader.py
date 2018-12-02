"""
Created on Mon Sep 10 16:27:26 2018

@author: Michele
"""


final='aux(be,is,sing).\naux(be,are,plur).\naux(be,was,past).\naux(be,been,part).\naux(dont,doesnt,sing).\naux(dont,dont,plur).\naux(dont,didnt,past).\n\n\n'
def irreg():
    fname_irreg= 'irregular_row.csv'
    with open(fname_irreg) as f:
        content = f.readlines()
        f.close()
    content = [x.strip() for x in content]
    final_irreg=''
    print(len(content))
    for i in range(len(content)):
        
        string=content[i]
        list_tempi=string.split(';')
        present=list_tempi[0]
        past=list_tempi[1]
        part=list_tempi[2]
        i=i+1
        output1='verb('+present+','+present+'s'+',sing)'
        output2='verb('+present+','+present+',plur)'
        output3='verb('+present+','+past+',past)'
        output4='verb('+present+','+part+',part)'
        
        final_irreg=final_irreg+output1+'.\n'+output2+'.\n'+output3+'.\n'+output4+'.\n\n'
    return final_irreg


def reg():
    fname_reg  = 'regular_row.csv'
    with open(fname_reg) as f:
        content = f.readlines()
        f.close()
    content = [x.strip() for x in content]
    final_reg=''
    print(len(content))
    for i in range(len(content)):
        
        string=content[i]
        list_tempi=string.split(';')
        present=list_tempi[0]
        past=list_tempi[1]
        part=list_tempi[2]
        i=i+1
        output1='verb('+present+','+present+'s'+',sing)'
        output2='verb('+present+','+present+',plur)'
        output3='verb('+present+','+past+',past)'
        output4='verb('+present+','+part+',part)'
        final_reg=final_reg+output1+'.\n'+output2+'.\n'+output3+'.\n'+output4+'.\n\n'
    return final_reg

final_reg=reg()
final_irreg=irreg()


final=final+final_irreg+final_reg

print(final_irreg)

f= open("conj_verbs.pl","w+")
f.write(final)
f.close()
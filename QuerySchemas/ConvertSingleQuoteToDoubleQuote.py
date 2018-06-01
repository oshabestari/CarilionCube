
import html
import re
import sqlparse
import format_sql as fsql

with open('./input/queries.txt', 'r') as f:
    content = f.readlines()
# you may also want to remove whitespace characters like `\n` at the end of each line
content = [x.strip() for x in content]


with open('./output/queries.sql', 'w') as f:
    for l in content:
        if 'set @xml=' in l:
            l = l.replace("set @xml='", '')
            l = l[:-1]
            l = html.unescape(l)

            print(l)
            fmt = sqlparse.format(l, reindent=True)
            if (fmt is not None):
               l = fmt
            
            # fmt = fsql.format_sql(l, debug=True)
            # if (fmt is not None):
            #     l = '\n'.join(fmt)
            
            l = l.replace("'", "''''")
            
            l = "set @xml='" + l + "'"
            # m = re.findall(r'from\b.*', l, re.IGNORECASE)
            # for mm in m:
            #     print(mm)
        f.write(l + '\n')


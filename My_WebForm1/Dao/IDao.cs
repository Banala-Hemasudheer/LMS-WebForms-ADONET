using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace My_WebForm1.Dao
{
    internal interface IDao
    {
        int Update(object model);

        int Delete(object model);

        int Insert(object model);

    }
}

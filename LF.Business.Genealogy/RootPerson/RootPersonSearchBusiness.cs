using ConnectDatabase;
using Domain;
using Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class RootPersonSearchBusiness: Connection
    {
        public bool isFirstLoad { get; set; }
        public RootPersonSearch Item { get; set; }
        public List<dynamic> Execute()
        {
            if (isFirstLoad)
            {
                using (var cmd = new RootPersonSearchAndGetTotalPagesRepository())
                {
                    cmd.Item = this.Item;
                    return cmd.Execute();
                }
            }
            else
            {
                using (var cmd = new RootPersonSearchRepository())
                {
                    cmd.Item = this.Item;
                    return cmd.Execute();
                }
            }

            //if (pageSize == 0 && pageSkip == 0)
            //{
            //    using (var cmd = new RootBranchGetBranchByIdRepository())
            //    {
            //        cmd.Id = Id;
            //        return cmd.Execute();
            //    }
            //}
            //else
            //{
            //    List<dynamic> result = new List<dynamic>();
            //    using (var cmd = new RootBranchGetBranchByIdRepository())
            //    {
            //        cmd.Id = Id;
            //        result.Add(cmd.Execute());
            //    }

            //    using (var cmd = new RootBranchGetByIdRepository())
            //    {
            //        cmd.Id = Id;
            //        cmd.pageSize = pageSize;
            //        cmd.pageSkip = pageSkip;
            //        result.Add(cmd.Execute());
            //    }
            //    return result;
            //}
        }
    }
}

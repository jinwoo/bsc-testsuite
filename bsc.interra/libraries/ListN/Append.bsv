package Append;

import ListN :: *;

function Action displayabc (a abc) provisos (Bits #(a, sa));
    action
      $display ("%d", abc);
    endaction
endfunction



function Action display_list (ListN #(n,a) my_list) provisos (Bits # (a,sa));
     action
       joinActions ( map (displayabc, my_list));
     endaction
endfunction



module mkTestbench_Append();
   ListN #(5,UInt #(4)) my_list1 = cons (0, cons (1, cons (2, cons (3, cons (4, nil)))));
   ListN #(5,UInt #(4)) my_list2 = cons (5, cons (6, cons (7, cons (8, cons (9, nil)))));
   ListN #(10,UInt #(4)) my_list3 = cons (0, cons (1, cons (2, cons (3, cons (4, cons (5, cons (6, cons (7, cons (8, cons (9, nil))))))))));


   rule fire_once (True);
      $display("ListN1:");
      display_list (my_list1);
      $display("ListN2:");
      display_list (my_list2);
      $display("Appended ListN:");
      display_list (append(my_list1, my_list2));
      if (my_list3 != append (my_list1, my_list2)) 
        $display ("Simulation Fails");
      else
        $display ("Simulation Passes");
	  $finish(2'b00);
   endrule 
      
endmodule : mkTestbench_Append
endpackage : Append

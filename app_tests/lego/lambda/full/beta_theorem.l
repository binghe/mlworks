(*
 * Copyright (c) 1998, Harlequin Group plc
 * All rights reserved
 *
 * $Log: beta_theorem.l,v $
 * Revision 1.1  1998/08/06 10:36:11  jont
 * new unit
 * Lego test application
 *
 *
 *)
Goal {ve:val_env}{s:state}{e1,e2:exp}{esafe:safe e2 ve}
     {v1,v2:val}{s1,s2:state}
     {eval1: sem ve s (app (fn e1) e2) v1 s1}
     {eval2: sem ve s (sub e1 e2 Z) v2 s2}
     and (equiv v1 v2)(state_equiv s1 s2);
intros;
Refine extract_app eval1;intros ____;Refine and3_elim;intros _;
Refine extract_fn H;intros __;
Qrepl H1;Qrepl H2;intros;
Refine cut (apply_thm H4);intros;
Refine subst_theorem esafe H3 (ve_equiv_eq ve);
Refine e1;
Refine empty_ve;
Refine empty_ve;
Refine +2 H5;
Refine +1 eval2;
Refine state_equiv_eq;
Refine Q_sym (safe_theorem2 esafe H3);
Refine ve_equiv_eq;


Save beta_thm;
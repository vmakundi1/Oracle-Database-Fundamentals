--Question 3--
create or replace procedure PR_Q3 (P_Broker_Number number, P_Email_Address varchar2).
authid current_user
as
begin
update Broker
set
Email_Address = P_Email_Address
where Broker_Number = P_Broker_Number;

end PR_Q3;
/
SHOW ERRORS;








--Question 5--
create or replace trigger tr_q5
before insert on transaction
for each row
declare
v_Buy_Sell char(1);


begin
select 
from Transaction
where v_Buy_Sell
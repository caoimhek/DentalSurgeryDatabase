-- Select query from view to get the appointments which have been attended.

SELECT * from appointmentDiary WHERE status = 'attended';

-- Select query from view to get attended appointments where the reason was a filling.

SELECT * from appointmentDiary WHERE status = 'attended' and reason = 'filling';

-- Insert query to schedule a future appointment for an existing patient.

insert into appointment (patientId, date, time, reason, duration, status, id, dentistId) values ('109', '2020-06-14', '09:30:00', 'extraction', '00:30:00', 'scheduled', '11014' , '11');

-- Update query to update the price of a treatment i.e extraction. 

UPDATE price set fee = '35.00' WHERE id = '14';

-- Insert specialisation information of the dentists into the specialisation table. 

insert into specialisation ( dentistId, specialisation) 
	VALUES ('12', 'orthodontics') , ('13', 'prosthodontics'), ('14', 'periodontics'), 
	('14', 'general practice') , ('15', 'orthodontics'), ('15', 'general practice'), 
	('16', 'periodontics') , ( '17', 'periodontics') , ('17', 'endodontics');


-- Selects the specialists and their contact information when 
-- the relevant specialisation is quried i.e. "orthodontist". 

SELECT specialisation.specialisation , dentist.id, dentist.email, dentist.address, 
 dentist.phone, dentist.name, dentist.surname
 from specialisation
 left join dentist on specialisation.dentistid = dentist.id
 where specialisation.specialisation = 'orthodontics';

 -- Updates a date in the appointment diary, i.e. reschedules an appointment to
 -- a new date. 

 update appointmentDiary set date = '2020-06-14' where id = 10412;

 -- This shows where the bill hasn't been paid or the total amount has not been paid.

select * from billPayments where billPayments.totalPayments < billPayments.billAmount;

-- Select query from appointment diary view that shows 
--patient information regarding appointments.

SELECT * from appointmentDiary where name = 'Katarina';

-- selects from the bills and filters the bills that are not paid.

select distinct bill.* from bill left join billPayments on bill.id = billPayments.billId
where billPayments.totalPayments < billPayments.billAmount 
or billPayments.billId is null;


	


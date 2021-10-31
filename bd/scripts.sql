DELIMITER $$
DROP PROCEDURE IF EXISTS `sp_horario_agenda`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_horario_agenda`(IN consultaData date, IN cpfPas varchar(11), IN crmMed int(11), IN consultorio int(11), IN especialidade int(3) )
Begin
     SET @ultimaConsulta  = 0;
     SET @contador = 0;
     SET @lcheckMedic = 0;
	 SET @ldataConsulta = ConsultaData;
     SET @lcpf = cpfPas;
     SET @lcrm = crmMed;
     SET @lconsultorio = consultorio;
     SET @lespecialidade = especialidade;
     
      SELECT count(cpfPaciente) from agenda 
			 where cpfPaciente = @lcpf 
             and dataConsulta = @ldataConsulta into @ultimaConsulta ;
      
      
       SELECT count(dataConsulta) from agenda 
                         where idConsultorio = @lconsultorio
                         and dataConsulta = @ldataConsulta into @contador;
                         
       SELECT idConsultorio from agenda 
                         where crm = @lcrm
                         and dataConsulta = @ldataConsulta limit 1  into @lcheckMedic;                  
             
      
     
      If @ultimaConsulta > 0 then
         SET @vSQL = 'SELECT "NUMERO MAXIMO DE CONSULTAS DESTE PACIENTE ATINGIDO" as RESULTADO, "ERROR" as STATUS';
       elseIf @contador = 12  then
			  SET @vSQL = 'SELECT " NUMERO DE CONSULTA DIARIAS EXCEDIDAS PARA ESTE CONSULTORIO" as RESULTADO, "ERROR" as STATUS';  
           elseIf ((@lcheckMedic > 0 ) AND ( @lcheckMedic <> @lconsultorio)) AND (@lespecialidade <> 2 ) then
                 SET @vSQL = 'SELECT " CONSULTORIO INDISPONIVEL PARA O MEDICO SELECIONADO" as RESULTADO, "ERROR" as STATUS';
               else  
                     SET @vSQL =  CONCAT(' SELECT ifnull(SEC_TO_TIME(TIME_TO_SEC(max(horaConsulta))+900), "08:00:00" ) as RESULTADO, "OK" as STATUS FROM agenda ',
							      ' WHERE idConsultorio = ', @lconsultorio , ' AND dataConsulta IN ("', @ldataConsulta,'")');
		   end if;
      
	 PREPARE my_Statement FROM @vSQL;
	 EXECUTE my_Statement;
		
     End$$
DELIMITER ;

CALL sp_horario_agenda(CONVERT('2021-10-30',date),'15901613864',95680,2,2);
CALL SP_max('especialidade','idespecialidade');

 
---------------------------------------------------------------
SELECT TIME(now()) AS "Horário original",
SEC_TO_TIME(TIME_TO_SEC(now())+900) as "Horário + 15 minutos"  ;
---------------------------------------------------------------
SELECT ifnull(SEC_TO_TIME(TIME_TO_SEC(max(horaConsulta))+900), "08:00:00" ) as RESULTADO, "OK" as STATUS FROM agenda
where idconsultorio = 1 and dataConsulta IN ( '2021-10-30');



SELECT count(cpfPaciente) from agenda where cpfPaciente = '88873406092'  and dataConsulta = '2021-10-30';

SELECT idConsultorio from agenda 
                         where crm = 95680
                         and dataConsulta = '2021-10-30' ;
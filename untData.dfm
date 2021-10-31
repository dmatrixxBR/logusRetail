object DM: TDM
  OldCreateOrder = False
  Height = 367
  Width = 541
  object FDQTemp: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'CALL sp_horario_agenda(:dataAg,:cpf,:crm,:consultorio,:especiali' +
        'dade)')
    Left = 264
    Top = 272
    ParamData = <
      item
        Name = 'DATAAG'
        DataType = ftDate
        FDDataType = dtDate
        ParamType = ptInput
        Value = '30/10/2021'
      end
      item
        Name = 'CPF'
        DataType = ftString
        FDDataType = dtAnsiString
        ParamType = ptInput
        Value = '12345678911'
      end
      item
        Name = 'CRM'
        DataType = ftInteger
        FDDataType = dtInt64
        ParamType = ptInput
        Value = '12345'
      end
      item
        Name = 'CONSULTORIO'
        DataType = ftInteger
        FDDataType = dtInt64
        ParamType = ptInput
        Value = '1'
      end
      item
        Name = 'ESPECIALIDADE'
        DataType = ftInteger
        FDDataType = dtInt64
        ParamType = ptInput
        Value = '1'
      end>
    object FDQTempRESULTADO: TStringField
      AutoGenerateValue = arDefault
      DisplayWidth = 300
      FieldName = 'RESULTADO'
      Origin = 'RESULTADO'
      ProviderFlags = []
      ReadOnly = True
      Size = 300
    end
    object FDQTempSTATUS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'STATUS'
      Origin = '`STATUS`'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
  end
  object dtTemp: TDataSource
    DataSet = FDQTemp
    Left = 200
    Top = 272
  end
  object FDQmedicos: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * from medicos')
    Left = 16
    Top = 72
    object FDQmedicoscrm: TIntegerField
      FieldName = 'crm'
      Origin = 'crm'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQmedicosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object FDQmedicosidade: TIntegerField
      FieldName = 'idade'
      Origin = 'idade'
      Required = True
    end
  end
  object FDQConsultorios: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * from consultorios')
    Left = 88
    Top = 72
    object FDQConsultoriosidconsultorios: TFDAutoIncField
      FieldName = 'idconsultorios'
      Origin = 'idconsultorios'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQConsultoriosdescricaoConsult: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'descricaoConsult'
      Origin = 'descricaoConsult'
    end
  end
  object FDQPacientes: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * from pacientes')
    Left = 160
    Top = 72
    object FDQPacientescpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 11
    end
    object FDQPacientesnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object FDQPacientesidade: TIntegerField
      FieldName = 'idade'
      Origin = 'idade'
      Required = True
    end
  end
  object FdQOAgenda: TFDQuery
    Active = True
    DetailFields = 'id_dono'
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM AGENDA')
    Left = 232
    Top = 72
    object FdQOAgendadataConsulta: TDateField
      FieldName = 'dataConsulta'
      Origin = 'dataConsulta'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FdQOAgendahoraConsulta: TTimeField
      FieldName = 'horaConsulta'
      Origin = 'horaConsulta'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FdQOAgendaidEspecialidade: TIntegerField
      FieldName = 'idEspecialidade'
      Origin = 'idEspecialidade'
      Required = True
    end
    object FdQOAgendacrm: TIntegerField
      FieldName = 'crm'
      Origin = 'crm'
      Required = True
    end
    object FdQOAgendaidConsultorio: TIntegerField
      FieldName = 'idConsultorio'
      Origin = 'idConsultorio'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FdQOAgendacpfPaciente: TStringField
      FieldName = 'cpfPaciente'
      Origin = 'cpfPaciente'
      Required = True
      Size = 11
    end
    object FdQOAgendaobs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'obs'
      Origin = 'obs'
      BlobType = ftMemo
    end
    object FdQOAgendanomeMedico: TStringField
      FieldKind = fkLookup
      FieldName = 'nomeMedico'
      LookupDataSet = FDQmedicos
      LookupKeyFields = 'crm'
      LookupResultField = 'nome'
      KeyFields = 'crm'
      Size = 100
      Lookup = True
    end
  end
  object dtAgenda: TDataSource
    DataSet = FdQOAgenda
    Left = 232
    Top = 16
  end
  object DtPacientes: TDataSource
    DataSet = FDQPacientes
    Left = 160
    Top = 16
  end
  object dtConsultorios: TDataSource
    DataSet = FDQConsultorios
    Left = 88
    Top = 16
  end
  object Dtmedicos: TDataSource
    DataSet = FDQmedicos
    Left = 16
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 321
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 321
    Top = 72
  end
  object FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink
    Left = 321
    Top = 128
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=logusmedics'
      'User_Name=logusmedics'
      'Password=logus'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 321
    Top = 192
  end
  object FDQEspecialidades: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * from especialidade')
    Left = 32
    Top = 168
    object FDQEspecialidadesidespecialidade: TIntegerField
      FieldName = 'idespecialidade'
      Origin = 'idespecialidade'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQEspecialidadesdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 45
    end
  end
  object DtEspecialidades: TDataSource
    DataSet = FDQEspecialidades
    Left = 112
    Top = 176
  end
  object FDQconsulta: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT a.dataConsulta as DataMarcada, a.horaConsulta as hora , e' +
        '.descricao as especialidade, c.descricaoConsult as consultorio, ' +
        'a.crm , m.nome as medico ,p.nome as paciente ,a.obs'
      'FROM agenda a'
      'JOIN  especialidade e on a.idEspecialidade = e.idEspecialidade'
      'JOIN  consultorios c on a.idConsultorio = c.idconsultorios'
      'JOIN  medicos m on a.crm = m.crm'
      'JOIN pacientes p on a.cpfPaciente = p.cpf'
      'ORDER BY dataConsulta,horaConsulta ASC;')
    Left = 352
    Top = 272
    object FDQconsultaDataMarcada: TDateField
      FieldName = 'DataMarcada'
      Origin = 'dataConsulta'
      Required = True
    end
    object FDQconsultahora: TTimeField
      FieldName = 'hora'
      Origin = 'horaConsulta'
      Required = True
    end
    object FDQconsultaespecialidade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'especialidade'
      Origin = 'descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 45
    end
    object FDQconsultaconsultorio: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'consultorio'
      Origin = 'descricaoConsult'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQconsultacrm: TIntegerField
      FieldName = 'crm'
      Origin = 'crm'
      Required = True
    end
    object FDQconsultamedico: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'medico'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FDQconsultapaciente: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'paciente'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FDQconsultaobs: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'obs'
      Origin = 'obs'
      BlobType = ftMemo
    end
  end
  object DtConsulta: TDataSource
    DataSet = FDQconsulta
    Left = 448
    Top = 216
  end
end

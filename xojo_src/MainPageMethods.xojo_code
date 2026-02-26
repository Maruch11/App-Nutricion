#tag Method, Flags = &h0
Sub LoginPressed()
  Var ok As Boolean = AuthService.Login(txtUsuario.Text, txtPassword.Text)
  If ok Then
    pgMain.SelectedPanelIndex = 1
  Else
    MessageBox("Credenciales inválidas")
  End If
End Sub
#tag EndMethod

#tag Method, Flags = &h0
Sub StartScan()
  lblScanStatus.Text = "Escaneando..."

  Var timerScan As New Timer
  timerScan.Period = 1200
  timerScan.RunMode = Timer.RunModes.Single
  AddHandler timerScan.Action, AddressOf ScanDone
End Sub
#tag EndMethod

#tag Method, Flags = &h21
Private Sub ScanDone(sender As Timer)
  lblScanStatus.Text = "DNI detectado"
  CargarPacientePorDni("42567890")
  pgMain.SelectedPanelIndex = 2
End Sub
#tag EndMethod

#tag Method, Flags = &h0
Sub CargarPacientePorDni(dni As String)
  lblDNI.Text = "42.567.890"
  lblPaciente.Text = "GARCÍA, JUAN CARLOS"

  lstMediciones.RemoveAllRows
  lstMediciones.AddRow("Talle", "2026-01-15", "175", "")
  lstMediciones.AddRow("Peso", "2026-01-15", "72.5", "")
  lstMediciones.AddRow("Circunferencia", "2026-01-15", "85", "")
  lstMediciones.AddRow("Pliegue 1", "2026-01-15", "12.5", "")
  lstMediciones.AddRow("Pliegue 2", "2026-01-15", "15.2", "")
End Sub
#tag EndMethod

#tag Method, Flags = &h0
Sub GuardarMediciones()
  Var payload As New JSONItem
  payload.Value("dni") = lblDNI.Text

  Var ok As Boolean = ApiClient.Post("/mediciones", payload.ToString)
  If ok Then
    MessageBox("Datos grabados correctamente")
  Else
    MessageBox("No se pudo guardar")
  End If
End Sub
#tag EndMethod

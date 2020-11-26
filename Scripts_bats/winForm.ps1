$Form = New-Object System.Windows.Forms.Form
$Form.Size = New-Object System.Drawing.Size(500,500)
#$Form.ShowDialog()
$Background = New-Object System.Windows.Forms.PictureBox
$Background.Width = 200
$Background.Height = 100
$Background.Location = New-Object system.drawing.point(00,00)
$Background.ImageLocation = "path to image"
$Background.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::Zoom



$Button_1                        = New-Object system.Windows.Forms.Button
$Button_1.text                   = "Folder"
$Button_1.width                  = 150
$Button_1.height                 = 50
$Button_1.location               = New-Object System.Drawing.Point(10,100)
$Button_1.Font                   = 'Microsoft Sans Serif,10'

$Folder = "path to directory or url"

$Button_2                        = New-Object system.Windows.Forms.Button
$Button_2.text                   = "Folder_2"
$Button_2.width                  = 150
$Button_2.height                 = 50
$Button_2.location               = New-Object System.Drawing.Point(10,160)
$Button_2.Font                   = 'Microsoft Sans Serif,10'

$Folder_2 = "path to directory or url"  

$Button_3                        = New-Object system.Windows.Forms.Button
$Button_3.text                   = "URL"
$Button_3.width                  = 150
$Button_3.height                 = 50
$Button_3.location               = New-Object System.Drawing.Point(10,220)
$Button_3.Font                   = 'Microsoft Sans Serif,10'

$URL = "path to directory or url"

$Button_4                        = New-Object system.Windows.Forms.Button
$Button_4.text                   = "URL_2"
$Button_4.width                  = 150
$Button_4.height                 = 50
$Button_4.location               = New-Object System.Drawing.Point(10,280)
$Button_4.Font                   = 'Microsoft Sans Serif,10'

$URL_2 = "path to directory or url"

$Button_5                        = New-Object system.Windows.Forms.Button
$Button_5.text                   = "URL_3"
$Button_5.width                  = 150
$Button_5.height                 = 50
$Button_5.location               = New-Object System.Drawing.Point(200,100)
$Button_5.Font                   = 'Microsoft Sans Serif,10'

$URL_3 = "path to directory or url"

$Button_6                        = New-Object system.Windows.Forms.Button
$Button_6.text                   = "URL_4"
$Button_6.width                  = 150
$Button_6.height                 = 50
$Button_6.location               = New-Object System.Drawing.Point(200,160)
$Button_6.Font                   = 'Microsoft Sans Serif,10'

$URL_4 = "path to directory or url"

$Button_1.Add_Click({Start-Process $Folder})
$Button_2.Add_Click({Start-Process $Folder_2})
$Button_3.Add_Click({Start-Process $URL})
$Button_4.Add_Click({Start-Process $URL_2})
$Button_5.Add_Click({Start-Process $URL_3})
$Button_6.Add_Click({Start-Process $URL_4})
$Form.Controls.Add($Background)
$Form.Controls.Add($Button_1)
$Form.Controls.Add($Button_2)
$Form.Controls.Add($Button_3)
$Form.Controls.Add($Button_4)
$Form.Controls.Add($Button_5)
$Form.Controls.Add($Button_6)
$Form.ShowDialog()
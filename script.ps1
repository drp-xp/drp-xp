Add-Type -AssemblyName System.Windows.Forms, System.Drawing

$form = [System.Windows.Forms.Form]@{
    BackColor       = [System.Drawing.Color]::Red
    FormBorderStyle = 'None'
    WindowState     = 'Maximized'
    TopMost         = $true
    ShowInTaskbar   = $false
}

$timer = [System.Windows.Forms.Timer]@{
    Interval = 30000
}

# Fecha a janela e para o timer ao atingir o tempo limite
$timer.Add_Tick({
    $timer.Stop()
    $form.Close()
})
$form.Add_Shown({
    [System.Windows.Forms.Cursor]::Hide()
    $timer.Start()
})

try {
    [void]$form.ShowDialog()
}
finally {
    [System.Windows.Forms.Cursor]::Show()
    $timer.Dispose()
    $form.Dispose()
}

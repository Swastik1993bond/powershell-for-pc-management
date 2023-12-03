# Load the Windows Forms assembly
Add-Type -AssemblyName System.Windows.Forms

# Create the main form for user input
$form = New-Object System.Windows.Forms.Form
$form.Text = "New User Creation Form"
$form.Size = New-Object System.Drawing.Size(300, 250)

# Create controls for user input
$labelUsername = New-Object System.Windows.Forms.Label
$labelUsername.Text = "Username:"
$labelUsername.Location = New-Object System.Drawing.Point(20, 20)

$textBoxUsername = New-Object System.Windows.Forms.TextBox
$textBoxUsername.Location = New-Object System.Drawing.Point(20, 40)

$labelPassword = New-Object System.Windows.Forms.Label
$labelPassword.Text = "Password:"
$labelPassword.Location = New-Object System.Drawing.Point(20, 70)

$textBoxPassword = New-Object System.Windows.Forms.TextBox
$textBoxPassword.Location = New-Object System.Drawing.Point(20, 90)
$textBoxPassword.PasswordChar = '*'  # Mask the password input

$buttonCreateUser = New-Object System.Windows.Forms.Button
$buttonCreateUser.Text = "Create User"
$buttonCreateUser.Location = New-Object System.Drawing.Point(20, 120)
$buttonCreateUser.Add_Click({
    $username = $textBoxUsername.Text
    $password = $textBoxPassword.Text

    if (-not [string]::IsNullOrWhiteSpace($username) -and -not [string]::IsNullOrWhiteSpace($password)) {
        $output = Create-NewUser $username $password
        Show-OutputForm $output
        $form.Close()
    } else {
        [System.Windows.Forms.MessageBox]::Show("Please enter a valid username and password.", "Error", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})

# Function to create a new user
function Create-NewUser($username, $password) {
    # Add your logic here to create a new user
    # Example: New-LocalUser -Name $username -Password $password -AccountNeverExpires
    $output = "New user created: $username"
    Write-Host $output
    return $output
}

# Function to show the output in a separate form
function Show-OutputForm($output) {
    $outputForm = New-Object System.Windows.Forms.Form
    $outputForm.Text = "Output"
    $outputForm.Size = New-Object System.Drawing.Size(300, 150)

    $labelOutput = New-Object System.Windows.Forms.Label
    $labelOutput.Text = $output
    $labelOutput.Location = New-Object System.Drawing.Point(20, 20)

    $buttonClose = New-Object System.Windows.Forms.Button
    $buttonClose.Text = "Close"
    $buttonClose.Location = New-Object System.Drawing.Point(20, 80)
    $buttonClose.Add_Click({ $outputForm.Close() })

    $outputForm.Controls.Add($labelOutput)
    $outputForm.Controls.Add($buttonClose)

    $outputForm.ShowDialog()
}

# Add controls to the main form
$form.Controls.Add($labelUsername)
$form.Controls.Add($textBoxUsername)
$form.Controls.Add($labelPassword)
$form.Controls.Add($textBoxPassword)
$form.Controls.Add($buttonCreateUser)

# Show the main form
$form.ShowDialog()

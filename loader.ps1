<#
.SYNOPSIS
Generates a file code that opens cmd and generates random 40-digit numbers for a specified duration.

.DESCRIPTION
This function generates a PowerShell script that opens the command prompt (cmd.exe) and generates random 40-digit numbers for a specified duration. After the duration, it displays a message in green text indicating that it is connected to the Roblox client.

.PARAMETER duration
The duration (in seconds) for which the random numbers should be generated.

.OUTPUTS
[string]
Returns the PowerShell script code that can be saved to a file.

.EXAMPLE
Generate-RandomNumbersScript -Duration 20
Generates a PowerShell script that opens cmd, generates random numbers for 20 seconds, and displays a message indicating connection to the Roblox client.
#>
function Generate-RandomNumbersScript {
    param (
        [int]$Duration
    )

    $script = @"
# Open cmd.exe
Start-Process cmd.exe

# Generate random 40-digit numbers for the specified duration
$StartTime = Get-Date
$EndTime = $StartTime.AddSeconds($Duration)

while ((Get-Date) -lt $EndTime) {
    $RandomNumber = Get-Random -Minimum 1000000000000000000000000000000000000000 -Maximum 9999999999999999999999999999999999999999
    Write-Output $RandomNumber
    Start-Sleep -Milliseconds 100
}

# Display the message in green text
Write-Host "Connected to Roblox client" -ForegroundColor Green
"@

    return $script
}

# Unit tests for the Generate-RandomNumbersScript function

<#
.SYNOPSIS
Test the Generate-RandomNumbersScript function for correctness.
#>
function Test-GenerateRandomNumbersScript {
    # Test with a duration of 20 seconds
    $script = Generate-RandomNumbersScript -Duration 20
    if ($script -notmatch "Start-Process cmd.exe") {
        Write-Output "Test failed for duration 20 seconds"
    }

    # Test with a duration of 0 seconds
    $script = Generate-RandomNumbersScript -Duration 0
    if ($script -notmatch "Start-Process cmd.exe") {
        Write-Output "Test failed for duration 0 seconds"
    }
}

# Usage example for the Generate-RandomNumbersScript function

# Generate the PowerShell script for a duration of 20 seconds
$scriptCode = Generate-RandomNumbersScript -Duration 20

# Save the script code to a file
$scriptCode | Out-File -FilePath "RandomNumbersScript.ps1" -Encoding UTF8

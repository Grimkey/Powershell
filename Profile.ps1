# Useful for writing integer dates for a build
# Example: Write-BuildDate (Get-Date)
function Write-BuildDate($d) {
    $y = $d.Year % 2000
    $m = $d.Month
    $day = $d.Day

    "$(($y * 400) + ($m * 31) + ($day))"
}

# Get an integer offset for today accurate to seconds (Max number is 90060)
# Example: Write-Timeoffset (Get-Date)
function Write-Timeoffset($d) {
    $morning = get-date (get-date).ToShortDateString()
    $timeToNow = (get-date).Subtract($morning)

    $h = $timeToNow.Hours
    $m = $timeToNow.Minutes
    $s = $timeToNow.Seconds

    "$(($h * 3600) + ($m * 60) + $s)"
}

# Get a four number version
# Example: Write-Version 1 0
function Write-Version {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, Position = 1)][int]$major,
        [Parameter(Mandatory, Position = 2)][int]$minor
    )

    "$major.$minor.$(Write-BuildDate (Get-Date)).$(Write-Timeoffset (Get-Date))"
}

# Useful for writing integer dates for a build
function Write-BuildDate($d) {
    $y = $d.Year % 2000
    $m = $d.Month
    $day = $d.Day

    "$(($y * 400) + ($m * 31) + ($day))"
}

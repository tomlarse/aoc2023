function Get-CalibrationValuesSum {
    param (
        $CalibrationDocument
    )

    $sum = 0

    foreach ($line in $CalibrationDocument -split '\n') {
        $chars = ($line -replace '\D', '').ToCharArray()
        $sum += "$($chars | Select-Object -First 1)$($chars | Select-Object -Last 1)"
    }

    $sum
}
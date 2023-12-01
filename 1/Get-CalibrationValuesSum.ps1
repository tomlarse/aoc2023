function Get-CalibrationValuesSum {
    param (
        $CalibrationDocument
    )

    $sum = 0

    $replacemap = @{
        'zero' = '0o'
        'one' = '1e'
        'two' = '2o'
        'three' = '3e'
        'four' = '4r'
        'five' = '5e'
        'six' = '6x'
        'seven' = '7n'
        'eight' = '8t'
        'nine' = '9e'
        '1' = '1'
        '2' = '2'
        '3' = '3'
        '4' = '4'
        '5' = '5'
        '6' = '6'
        '7' = '7'
        '8' = '8'
        '9' = '9'
        '0' = '0'
    }

    foreach ($line in $CalibrationDocument -split '\n') {
        $washedline = $line -replace '(zero|one|two|three|four|five|six|seven|eight|nine|0|1|2|3|4|5|6|7|8|9)', {$replacemap["$($_.Captures)"]}
        #do it twice to catch any shared starting/ending characters. eg eightthree
        $washedline = $washedline -replace '(zero|one|two|three|four|five|six|seven|eight|nine|0|1|2|3|4|5|6|7|8|9)', {$replacemap["$($_.Captures)"]}
        $chars = ($washedline -replace '\D', '').ToCharArray()
        #"$($chars | Select-Object -First 1)$($chars | Select-Object -Last 1)"
        $sum += "$($chars | Select-Object -First 1)$($chars | Select-Object -Last 1)"
    }

    $sum
}

$in2 = @"
two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
eighthree
"@

#eighthree testcase was the worst :O
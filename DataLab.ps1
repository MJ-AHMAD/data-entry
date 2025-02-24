# DataLab.ps1

# সার্ভার থেকে ডাটা সংগ্রহ করার জন্য URL
$url = "https://mj-ahmad.github.io/data-entry"

# HTTP GET অনুরোধ পাঠান এবং HTML ডাটা সংগ্রহ করুন
$response = Invoke-WebRequest -Uri $url

# HTML ডাটা থেকে ফর্ম ইনপুট ফিল্ডগুলি বের করুন
$formFields = $response.ParsedHtml.getElementsByTagName("input")

# ডাটা সংরক্ষণের জন্য একটি পাথ নির্ধারণ করুন
$outputFile = "form_data.csv"

# ফর্ম ডাটাকে সংগ্রহ এবং সংরক্ষণ করুন
$header = "Name,Value"
$rows = @()

foreach ($field in $formFields) {
    $name = $field.name
    $value = $field.value
    $rows += "$name,$value"
}

# CSV ফাইলে ডাটা লিখুন
$header | Out-File -FilePath $outputFile
$rows | Out-File -FilePath $outputFile -Append

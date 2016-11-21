<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>

<p>Geachte heer of mevrouw,</p>
<br>
<div>
    <table border="1" cellpadding="0" cellspacing="0">
        <tr>
            <th style="padding: 3px">Name :</th>
            <td style="padding: 3px">{{ isset($leave->user_id)?ucfirst($leave->relUser->username):''}}</td>
            <th style="padding: 3px">Email :</th>
            <td style="padding: 3px">{{ isset($leave->user_id)?ucfirst($leave->relUser->email):''}}</td>
        </tr>
        <tr>
            <th style="padding: 3px">Leave From :</th>
            <td style="padding: 3px">{{ isset($leave->from_date)?date('D j M o', strtotime($leave->from_date) ):''}}</td>
            <th style="padding: 3px">To</th>
            <td style="padding: 3px">{{ isset($leave->to_date)?date('D j M o', strtotime($leave->to_date) ):''}}</td>
        </tr>
        <tr>
            <th style="padding: 3px">Status :</th>
            <td style="padding: 3px" colspan="3">{{ isset($leave->status)?ucfirst($leave->status):''}}</td>
        </tr>
        @if(Session::get('user-role')!='worker')
        <tr>
            <th style="padding: 3px">{{ isset($leave->status)?ucfirst($leave->status):''}} By :</th>
            <td style="padding: 3px" colspan="3">{{ isset($leave_detail->user_id)?ucfirst($leave_detail->relUser->username):''}}</td>
        </tr>
        @endif
        <tr>
            <th style="padding: 3px">Reason :</th>
            <td style="padding: 3px" colspan="3">{{ isset($leave->reason)?ucfirst($leave->reason):''}}</td>
        </tr>
    </table>


</div>
</body>
</html>


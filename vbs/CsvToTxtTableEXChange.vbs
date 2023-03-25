'┌───────┬─────────────────┐
'│プログラム名称│CsvToTxtTableEXchange　　　　　　 │
'├───────┼─────────────────┤
'│備考　　　　　│ChatGPT4を利用して作成しています。│
'└───────┴─────────────────┘
Const ForReading = 1
Const ForWriting = 2

' CSVファイルを読み込む
Dim fso, file, inputText
Set fso = CreateObject("Scripting.FileSystemObject")
Set file = fso.OpenTextFile("input.csv", ForReading)
inputText = file.ReadAll
file.Close

' 改行文字で文字列を分割する
Dim lines
lines = Split(inputText, vbNewLine)

' 各列の最大幅を求める
Dim widths()
ReDim widths(UBound(Split(lines(0), ",")))
For Each line In lines
    Dim fields_arr
    fields_arr = Split(line, ",")
    For i = 0 To UBound(fields_arr)
        If Len(fields_arr(i)) > widths(i) Then
            widths(i) = Len(fields_arr(i))
        End If
    Next
Next

' 表の罫線を作成する
Dim table
table = ""
For Each line In lines
    table = table & "+"
    Dim fields
    fields = Split(line, ",")
    For i = 0 To UBound(fields)
        table = table & String(widths(i) + 2, "-") & "+"
    Next
    table = table & vbNewLine

    table = table & "|"
    For i = 0 To UBound(fields)
        table = table & " " & fields(i) & String(widths(i) - Len(fields(i)), " ") & " |"
    Next
    table = table & vbNewLine
Next

' 表の罫線を追加する
Dim separator
separator = "+"
For i = 0 To UBound(widths)
    separator = separator & String(widths(i) + 2, "-") & "+"
Next
separator = separator & vbNewLine

table = separator & table & separator

' テキストファイルに出力する
Set file = fso.OpenTextFile("output.txt", ForWriting, True)
file.Write(table)
file.Close
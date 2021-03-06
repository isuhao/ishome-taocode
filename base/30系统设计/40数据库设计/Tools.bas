Attribute VB_Name = "Tools"
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'数据库与JFP框架代码片段生成工具
'
'版本 0.2 2012-9-19 升级为MyBatis 3.1系列XML做成
'作者 Spook
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

Const dataStartLine = 7
Const dataEndLine = 100

Const itemNameCol = 3
Const fieldNameCol = 20
Const propertiesCol = 31
Const numberCol = 36
Const keyCol = 39
Const mustCol = 42
Const defaultCol = 46


Dim SYSNAME        As String
Dim spgname         As String
Dim sdbname         As String
Dim sfxdate         As String
Dim sver           As String
Dim sclName           As String

Dim itemValue          As String
Dim fieldValue    As String
Dim numberValue          As String
Dim mustValue          As String
Dim propertiesValue          As String
Dim keyValue          As String
Dim defaultValue      As String

Dim result           As Boolean
    
Public sfileName As String
Sub CreatField()

On Error GoTo Open_Error
   
    Dim WK_Str      As String
    Dim i           As Integer
    Dim strKeyName      As String
    Dim strKeyComm      As String
    
    Dim strItem          As String
    Dim strUpdateVal     As String
    Dim strInsertVal     As String
    Dim strWhereVal      As String
    
    Application.ScreenUpdating = False
       
    'Head .............
    For i = dataStartLine To 100     '开始循环
        WK_Str = ""
        itemValue = Cells(i, 10).Value
        If itemValue <> "" Then
            Cells(i, 45).Value = getPinyinValue(itemValue)
        End If
        
    Next i
   
    
    MsgBox ("执行完了")
    
    Exit Sub
    
Open_Error:
    MsgBox ("请再次运行")
End Sub

'''
'''获得汉字的拼音码
'''
Function getPinyinValue(ByVal x As String) As String
On Error Resume Next
Dim i As Integer
For i = 1 To Len(x)
    If Mid(x, i, 1) <> " " And Asc(Mid(x, i, 1)) < 0 Then getPinyinValue = getPinyinValue & Mid("ABCDEFGHJKLMNOPQRSTWXYZZ", Evaluate("MATCH(" & Asc(Mid(x, i, 1)) & ",{-20319,-20283,-19775,-19218,-18710,-18526,-18239,-17922,-17417,-16474,-16212,-15640,-15165,-14922,-14914,-14630,-14149,-14090,-13318,-12838,-12556,-11847,-11055,-10247},1)"), 1)
Next
End Function


Function getSQLValue(line As Integer) As Boolean
       
    itemValue = Trim(Cells(line, itemNameCol).Value)
    fieldValue = Trim(Cells(line, fieldNameCol).Value)
    numberValue = Trim(Cells(line, numberCol).Value)
    propertiesValue = UCase(Trim(Cells(line, propertiesCol).Value))
    mustValue = UCase(Trim(Cells(line, mustCol).Value))
    keyValue = UCase(Trim(Cells(line, keyCol).Value))
    defaultValue = Trim(Cells(line, defaultCol).Value)

    If fieldValue = "" Then
        getSQLValue = False
    Else
        fieldValue = UCase(fieldValue)
        getSQLValue = True
    End If
    
End Function

Function getEntityValue(line As Integer) As Boolean
       
    itemValue = Trim(Cells(line, itemNameCol).Value)
    fieldValue = Trim(Cells(line, fieldNameCol).Value)
    numberValue = Trim(Cells(line, numberCol).Value)
    propertiesValue = (Trim(Cells(line, propertiesCol).Value))
    mustValue = UCase(Trim(Cells(line, mustCol).Value))
    keyValue = UCase(Trim(Cells(line, keyCol).Value))
    defaultValue = Trim(Cells(line, defaultCol).Value)

    If fieldValue = "" Then
        getEntityValue = False
    Else
        fieldValue = upFirstStr(fieldValue)
        getEntityValue = True
    End If
    
End Function


Function upFirstStr(SynStr As String) As String
     upFirstStr = UCase(Left(SynStr, 1)) & (Right(SynStr, Len(SynStr) - 1))
End Function

Function downFirstStr(SynStr As String) As String
     downFirstStr = LCase(Left(SynStr, 1)) & (Right(SynStr, Len(SynStr) - 1))
End Function
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub CreatSQL()

    SYSNAME = Cells(1, 52).Value
    spgname = Cells(1, 31).Value
    sdbname = SYSNAME & Cells(1, 62).Value
    'sver = Cells(4, 78).Value
       
    sfxdate = Format(Date, "YYYY/MM/DD")

    '获得文件名称
    sfileName = Application.GetSaveAsFilename(InitialFilename:=sdbname & "", _
                          fileFilter:="sql , *.sql")
    
    If sfileName = "" Or sfileName = "False" Then
        MsgBox ("请指定文件名称")
         Exit Sub
    End If
        
On Error GoTo Open_Error
    Const OBJ_EXT = ".SQL"
    If UCase(Right(sfileName, Len(OBJ_EXT))) = OBJ_EXT Then
        sfileName = Left(sfileName, Len(sfileName) - Len(OBJ_EXT))
    End If
    
    Dim sKeyName As String
    Dim index As Integer
    
    sKeyName = sfileName
    index = InStr(sKeyName, "\")
    While index > 0
        sKeyName = Mid(sKeyName, index + 1)
        index = InStr(sKeyName, "\")
    Wend
    
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Open sfileName & ".sql" For Output Shared As #1
    
    Dim WK_Str      As String
    Dim i           As Integer
    Dim strKeyName      As String
    Dim strKeyComm      As String
    
    Dim strItem          As String
    Dim strUpdateVal     As String
    Dim strInsertVal     As String
    Dim strWhereVal      As String
    
    Application.ScreenUpdating = False
    
    Print #1, "CREATE TABLE " & LCase(sdbname)
    Print #1, "("
    
    'Head .............
    For i = dataStartLine To dataEndLine     '开始循环
        WK_Str = ""
        If Not getSQLValue(i) Then
            Exit For
        End If
    
        '/**********输出字段项目**********/
        'SQLID VARCHAR2(200) DEFAULT 0
        If fieldValue <> "" Then
            If strItem <> "" Then
                strItem = strItem & " , " & fieldValue
                strInsertVal = strInsertVal & " , " & "?"
                strUpdateVal = strUpdateVal & " ; " & fieldValue & " = ?"
            Else
                strItem = fieldValue
                strInsertVal = "?"
                strUpdateVal = fieldValue & " = ?"
            End If
        End If
        
        '关键字
        If keyValue <> "" Then
            If strKeyName <> "" Then
                strKeyName = strKeyName & " , " & fieldValue
                strWhereVal = strWhereVal & " ; " & fieldValue & " = ?"
            Else
                strKeyName = fieldValue
                strWhereVal = fieldValue & " = ?"
            End If
            
            mustValue = "Y"
            Range("AO" & i).Select   '& ":AQ" & i
            ActiveCell.FormulaR1C1 = "Y"
        End If
        
        WK_Str = "    " & LCase(fieldValue)
        
        '类型
        If propertiesValue = "DATE" Or propertiesValue = "LONG" Then
            WK_Str = WK_Str & " " & propertiesValue
        ElseIf propertiesValue = "VARCHAR2" Then
            WK_Str = WK_Str & " " & "VARCHAR" & "(" & numberValue & ")"
        Else
            WK_Str = WK_Str & " " & propertiesValue & "(" & numberValue & ")"
        End If
        
        '默认值
        If defaultValue <> "" Then
            WK_Str = WK_Str & " DEFAULT '" & defaultValue & "'"
        End If

        '空
        If mustValue <> "" Then
            WK_Str = WK_Str & " NOT NULL"
        End If

        'MySQL
        'WK_Str = WK_Str & " COMMENT " & "'" & itemValue & "'"

        'SQL
        WK_Str = WK_Str & ","
'        Print #1, "    --" & itemValue
        Print #1, WK_Str
        
    Next i
    'OACLE 注解
    If strKeyName = "" Then
        strKeyName = "SEQNO"
        strKeyComm = "COMMENT ON COLUMN " & LCase(sdbname) & "." _
                & strKeyName & " IS 'SQL'"
     '   Print #1, "    --SQL斣崋"
        Print #1, "    SEQNO VARCHAR2(12) NOT NULL,"
    End If
    
    'Print #1, "    --僉乕忣曬"
    WK_Str = "PRIMARY KEY (" & LCase(strKeyName) & ")"
    Print #1, WK_Str
    
    Print #1, ")"
        
    Close #1
    
    MsgBox ("文件做成完了")
    
    Exit Sub
    
Open_Error:
    MsgBox ("文件做成失败" & Chr(13) & _
        "请再次运行")
End Sub


Sub CreatXML()

    SYSNAME = Cells(1, 52).Value
    spgname = Cells(1, 31).Value
    sdbname = SYSNAME & Cells(1, 62).Value
    'sver = Cells(4, 78).Value
       
    sfxdate = Format(Date, "YYYY/MM/DD")

    '获得文件名
    sfileName = Application.GetSaveAsFilename(InitialFilename:=sdbname & "", _
                          fileFilter:="xml , *.xml")
    
    If sfileName = "" Or sfileName = "False" Then
        MsgBox ("请指定文件名称")
         Exit Sub
    End If
        
On Error GoTo Open_Error
    Const OBJ_EXT = ".XML"
    If UCase(Right(sfileName, Len(OBJ_EXT))) = OBJ_EXT Then
        sfileName = Left(sfileName, Len(sfileName) - Len(OBJ_EXT))
    End If
    
    Dim WK_Str      As String
    Dim sKeyName As String
    Dim index As Integer
    
    sKeyName = sfileName
    index = InStr(sKeyName, "\")
    While index > 0
        sKeyName = Mid(sKeyName, index + 1)
        index = InStr(sKeyName, "\")
    Wend
    
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Open sfileName & ".xml" For Output Shared As #1
    Dim i           As Integer
    Dim sTemp As String
    '缩略名定义
    sTemp = "'" & sdbname & "DBO'"
    
    '生成缩略名
    'Print #1, "<!-- Need to Copy Into Config XML(mybatis.xml) file -->"
    'Print #1, "<!-- " & Trim(Cells(1, 31).Value) & " -->"
    'Print #1, "<typeAlias alias=" & sTemp & " type='org.jfp.business.xxx.example.bean." & sdbname & "DBO'/>"
    'Print #1, ""
    
    '生成头文件
    Print #1, "<?xml version='1.0' encoding='UTF-8' ?> "
    Print #1, "<!DOCTYPE mapper"
    Print #1, "    PUBLIC '-//mybatis.org//DTD Dao 3.0//EN' "
    Print #1, "    'http://mybatis.org/dtd/mybatis-3-mapper.dtd' >"
    Print #1, "<!-- " & Trim(Cells(1, 31).Value) & " -->"
    Print #1, "<!-- 需要和DAO保持完全路径一致 -->"
    Print #1, "<mapper namespace='." & sdbname & "Dao'>"
    
    '数据表映射
    'Print #1, "    <!-- 数据表映射 -->"
    'Print #1, "    <resultMap type=" & sTemp & " id='resultMapFromDate'>"
   ' For i = dataStartLine To dataEndLine     '循环处理
   '     If Not getEntityValue(i) Then
   '         Exit For
   '     End If
  '      '<result property="d0001" column="d0001"/><!-- 编号 -->
  '      Print #1, "        <result property=""" & fieldValue & """ column=""" & fieldValue & """/> <!-- " & itemValue & " -->"
  '  Next i
  '  Print #1, "    </resultMap>"
 '   Print #1, ""
    
    '输出表字段
    Print #1, "    <!-- 表字段信息  -->"
    Print #1, "    <sql id='tableColumns'>"
     WK_Str = "        "
    For i = dataStartLine To dataEndLine     '循环处理
        If Not getEntityValue(i) Then
            Exit For
        ElseIf i <> dataStartLine Then
                WK_Str = WK_Str & "," & LCase(fieldValue)
        Else
            WK_Str = WK_Str & LCase(fieldValue)
        End If
    Next i
    
    Print #1, WK_Str
    Print #1, "    </sql>"
    Print #1, ""
    
    '批量插入
    'Print #1, "    <!-- 批量插入  -->"
    'Print #1, "    <insert id='doBatchInsert' parameterType=" & sTemp & ">"
    'Print #1, "        INSERT INTO " & LCase(sdbname) & " ( <include refid='tableColumns'/> ) VALUES "
    'Print #1, "            <foreach collection='list' item='item' separator=','>"
    
    'WK_Str = "                ("
    'For i = dataStartLine To dataEndLine     '循环处理
    '    If Not getEntityValue(i) Then
    '        Exit For
    '    ElseIf i <> dataStartLine Then
    '        WK_Str = WK_Str & "," & "#{item." & LCase(fieldValue) & "}"
    '    Else
    '        WK_Str = WK_Str & " " & "#{item." & LCase(fieldValue) & "}"
    '    End If
    'Next i
    'WK_Str = WK_Str & " )"
    
    'Print #1, WK_Str
    'Print #1, "            </foreach>"
    'Print #1, "    </insert>"
     '批量删除
    'Print #1, "    <!-- 批量删除  -->"
    'Print #1, "    <delete id='doBatchDelete' parameterType=" & sTemp & ">"
    'Print #1, "        DELETE FROM " & LCase(sdbname) & " WHERE puk IN "
    'Print #1, "            <foreach collection='list' item='item' open='(' separator=',' close=')'>"
    'Print #1, "                #{item.puk}"
    'Print #1, "            </foreach>"
    'Print #1, "    </delete>"
    'Print #1, ""
    
    '根据条件更新所有记录
    Print #1, "    <!-- 根据条件更新所有记录 -->"
    Print #1, "    <update id='doUpdateAll' parameterType=" & sTemp & ">"
    Print #1, "        UPDATE " & LCase(sdbname) & " SET  uu1 = #{uuu} <!-- 更新时间、更新者 -->"
    For i = dataStartLine + 1 To dataEndLine    '循环处理
        If Not getEntityValue(i) Then
            Exit For
        End If
        If keyValue <> "Y" Then
            If LCase(fieldValue) <> "uu1" Then
                '<if test=”state != null”>
                Print #1, "        <if test="" " & LCase(fieldValue) & " != null and " & LCase(fieldValue) & " !='' ""><!-- " & itemValue & " -->"
                Print #1, "            ," & LCase(fieldValue) & " = #{" & LCase(fieldValue) & "}"
                Print #1, "        </if>"
            End If
        End If
    Next i
    Print #1, "        WHERE 1 = 1"
    For i = dataStartLine To dataEndLine     '循环处理
        If Not getEntityValue(i) Then
            Exit For
        End If
        '<if test=”state != null”>
        Print #1, "        <if test="" " & LCase(fieldValue) & " != null and " & LCase(fieldValue) & " !='' ""><!-- " & itemValue & " -->"
        Print #1, "            AND " & LCase(fieldValue) & " = #{" & LCase(fieldValue) & "}"
        Print #1, "        </if>"
    Next i
    Print #1, "    </update>"
    
    '分页查询信息
    Print #1, "    <!-- 查询分页数据信息  -->"
    Print #1, "    <select id='doSelectPage' parameterType=" & sTemp & " resultType=" & sTemp & ">"
    Print #1, "        SELECT <include refid='tableColumns'/> FROM " & LCase(sdbname)
    Print #1, "        WHERE  1 = 1"
    For i = dataStartLine To dataEndLine     '循环处理
        If Not getEntityValue(i) Then
            Exit For
        End If
        '<if test=”state != null”>
        Print #1, "        <if test="" " & LCase(fieldValue) & " != null and " & LCase(fieldValue) & " !='' ""><!-- " & itemValue & " -->"
        Print #1, "            AND " & LCase(fieldValue) & " = #{" & LCase(fieldValue) & "}"
        Print #1, "        </if>"
    Next i
    Print #1, "    </select>"
    Print #1, ""
    
    '插入信息
    Print #1, "    <!-- 插入一条数据 -->"
    Print #1, "    <insert id='doInsert' parameterType=" & sTemp & ">"
    Print #1, "        INSERT INTO " & LCase(sdbname)
    Print #1, "          ( <include refid='tableColumns'/>) "
    Print #1, "        VALUES "
     WK_Str = "          ("
    For i = dataStartLine To dataEndLine     '循环处理
        If Not getEntityValue(i) Then
            Exit For
        ElseIf i <> dataStartLine Then
            WK_Str = WK_Str & "," & "#{" & LCase(fieldValue) & "}"
        Else
            WK_Str = WK_Str & " " & "#{" & LCase(fieldValue) & "}"
        End If
    Next i
    
    Print #1, WK_Str & " )"
    Print #1, "    </insert>"
    
    '修改信息
    Print #1, "    <!-- 修改一条数据 -->"
    Print #1, "    <update id='doUpdate' parameterType=" & sTemp & ">"
    Print #1, "        UPDATE " & LCase(sdbname) & " SET uu1 = #{uuu} <!-- 更新时间、更新者 -->"
    For i = dataStartLine + 1 To dataEndLine    '循环处理
        If Not getEntityValue(i) Then
            Exit For
        End If
        If keyValue <> "Y" Then
            If LCase(fieldValue) <> "uu1" Then
                '<if test=”state != null”>
                Print #1, "        <if test="" " & LCase(fieldValue) & " != null and " & LCase(fieldValue) & " !='' ""><!-- " & itemValue & " -->"
                Print #1, "            ," & LCase(fieldValue) & " = #{" & LCase(fieldValue) & "}"
                Print #1, "        </if>"
            End If
        End If
    Next i
    
    Print #1, "        WHERE puk = #{puk}"

    For i = dataStartLine + 1 To dataEndLine    '循环处理
        If Not getEntityValue(i) Then
            Exit For
        End If
        If keyValue <> "" Then
            '<if test=”state != null”>
            Print #1, "            <if test="" " & LCase(fieldValue) & " != null and " & LCase(fieldValue) & " !='' ""><!-- " & itemValue & " -->"
            Print #1, "                AND " & LCase(fieldValue) & " = #{" & LCase(fieldValue) & "}"
            Print #1, "            </if>"
        End If
    Next i
    
   
    Print #1, "            <if test="" uu1 != null and uu1 !='' ""><!-- 最后更新时间 -->"
    Print #1, "                AND uu1 = #{uu1}"
    Print #1, "            </if>"
    
    Print #1, "    </update>"
    
     '删除信息
    Print #1, "    <!-- 逻辑删除一条数据 -->"
    Print #1, "    <delete id='toDelete' parameterType=" & sTemp & ">"
    Print #1, "        UPDATE " & LCase(sdbname) & " SET ddd='1', uu1 = #{uuu}, uu2 = #{uu2} WHERE puk = #{puk}"
    
    For i = dataStartLine + 1 To dataEndLine    '循环处理
        If Not getEntityValue(i) Then
            Exit For
        End If
        If keyValue <> "" Then
            '<if test=”state != null”>
            Print #1, "            <if test="" " & LCase(fieldValue) & " != null and " & LCase(fieldValue) & " !='' ""><!-- " & itemValue & " -->"
            Print #1, "                AND " & LCase(fieldValue) & " = #{" & LCase(fieldValue) & "}"
            Print #1, "            </if>"
        End If
    Next i
    
   
    Print #1, "            <if test="" uu1 != null and uu1 !='' ""><!-- 最后更新时间 -->"
    Print #1, "                AND uu1 = #{uu1}"
    Print #1, "            </if>"
    
    Print #1, "    </delete>"
    
    '删除信息
    Print #1, "    <!-- 物理删除一条数据 -->"
    Print #1, "    <delete id='doDelete' parameterType=" & sTemp & ">"
    Print #1, "        DELETE FROM " & LCase(sdbname) & " WHERE puk = #{puk}"
    
    For i = dataStartLine + 1 To dataEndLine    '循环处理
        If Not getEntityValue(i) Then
            Exit For
        End If
        If keyValue <> "" Then
            '<if test=”state != null”>
            Print #1, "            <if test="" " & LCase(fieldValue) & " != null and " & LCase(fieldValue) & " !='' ""><!-- " & itemValue & " -->"
            Print #1, "                AND " & LCase(fieldValue) & " = #{" & LCase(fieldValue) & "}"
            Print #1, "            </if>"
        End If
    Next i
    
    Print #1, "            <if test="" uu1 != null and uu1 !='' ""><!-- 最后更新时间 -->"
    Print #1, "                AND uu1 = #{uu1}"
    Print #1, "            </if>"
    
    Print #1, "    </delete>"
    
    '查询信息
    Print #1, "    <!-- 查询一条数据  -->"
    Print #1, "    <select id='doRead' parameterType=" & sTemp & " resultType=" & sTemp & ">"
    Print #1, "        SELECT <include refid='tableColumns'/> FROM " & LCase(sdbname) & " WHERE 1 = 1"
    
    For i = dataStartLine To dataEndLine    '循环处理
        If Not getEntityValue(i) Then
            Exit For
        End If
        If keyValue <> "" Then
            '<if test=”state != null”>
            Print #1, "            <if test="" " & LCase(fieldValue) & " != null and " & LCase(fieldValue) & " !='' ""><!-- " & itemValue & " -->"
            Print #1, "                AND " & LCase(fieldValue) & " = #{" & LCase(fieldValue) & "}"
            Print #1, "            </if>"
        End If
    Next i
    
    Print #1, "            <if test="" ddd != null and ddd !='' ""><!-- 最后更新时间 -->"
    Print #1, "                AND ddd = #{ddd}"
    Print #1, "            </if>"
    
    Print #1, "    </select>"
    Print #1, ""
    
    '结束标记
    Print #1, "</mapper>"
    Close #1
    
    MsgBox ("文件做成完了")
    
    Exit Sub
    
Open_Error:
    MsgBox ("文件做成失败" & Chr(13) & _
        "请再次运行")
End Sub
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub CreatBean()

    SYSNAME = Cells(1, 52).Value
    spgname = Cells(1, 31).Value
    sdbname = SYSNAME & Cells(1, 62).Value
    sver = Cells(4, 78).Value
       
    sfxdate = Format(Date, "YYYY/MM/DD")

    sfileName = Application.GetSaveAsFilename(InitialFilename:=sdbname & "", _
                          fileFilter:="java  , *.java")
    
    If sfileName = "" Or sfileName = "False" Then
        MsgBox ("File Name")
        Exit Sub
    End If
        
On Error GoTo Open_Error
    
    Const OBJ_EXT = ".JAVA"
    If UCase(Right(sfileName, Len(OBJ_EXT))) = OBJ_EXT Then
        sfileName = Left(sfileName, Len(sfileName) - Len(OBJ_EXT))
    End If
    
    Dim sKeyName As String
    Dim index As Integer
    
    sKeyName = sfileName
    index = InStr(sKeyName, "\")
    While index > 0
        sKeyName = Mid(sKeyName, index + 1)
        index = InStr(sKeyName, "\")
    Wend
    
    Open sfileName & "PVO" & ".java" For Output Shared As #1
    
    Print #1, "import javax.inject.Named;"
    Print #1, " "
    Print #1, "@Named"
    Print #1, "/** " & Trim(Cells(1, 31).Value) & "*/"
    Print #1, "public class " & sdbname & "PVO extends " & sdbname & "DBO"
    
    Print #1, "{"
    Print #1, "}"
    
    Close #1
      
      
    Open sfileName & "DBO" & ".java" For Output Shared As #1
    
    Print #1, "import javax.inject.Named;"
    Print #1, " "
    Print #1, "@Named"
    Print #1, "/** " & Trim(Cells(1, 31).Value) & "*/"
    Print #1, "public class " & sdbname & "DBO extends MyDataBaseObjectSupport"
    
    Print #1, "{"
    
    Dim WK_Str      As String
    Dim i           As Integer
    Dim strKeyName      As String
      
    Application.ScreenUpdating = False
            
    'field
    For i = dataStartLine + 1 To dataEndLine
        WK_Str = ""
        If Not getEntityValue(i) Then
            Exit For
        End If
    
        If InStr(fieldValue, "BBB") > 0 Then
            Exit For
        End If
        '/**********项目设置**********/
        Print #1, "    /** "
        Print #1, "     * " & itemValue
        Print #1, "     */"
            
        fieldValue = LCase(fieldValue)
            
        '懏?
        'String
        WK_Str = "    private String " & (fieldValue) & " = """";"
            
        Print #1, WK_Str
        Print #1, " "
    Next i

    'get
    For i = dataStartLine + 1 To dataEndLine
        WK_Str = ""
        If Not getEntityValue(i) Then
            Exit For
        End If
    
        If InStr(fieldValue, "BBB") > 0 Then
            Exit For
        End If
    
        '/**********项目设置**********/
        Print #1, "    /** "
        Print #1, "     * 获取" & itemValue
        Print #1, "     *"
        Print #1, "     * @return " & fieldValue & " " & itemValue
        Print #1, "     */"
            
        fieldValue = LCase(fieldValue)
            
        '懏?
        'String
        WK_Str = "    public String get" & upFirstStr(fieldValue) & "() {"
            
        Print #1, WK_Str
        
        'return
        WK_Str = "        return this." & fieldValue & ";"
        Print #1, WK_Str
        Print #1, "    }"
        Print #1, " "
    Next i
   
    'set
    For i = dataStartLine + 1 To dataEndLine
        WK_Str = ""
        If Not getEntityValue(i) Then
            Exit For
        End If
    
        If InStr(fieldValue, "BBB") > 0 Then
            Exit For
        End If
    
        '/**********项目设置**********/
        Print #1, "    /** "
        Print #1, "     * 设置" & itemValue
        Print #1, "     *"
        Print #1, "     * @param " & (fieldValue) & " " & itemValue
        Print #1, "     */"
            
            
        'fieldValue = LCase(fieldValue)
            
        'String
        WK_Str = "    public void set" & upFirstStr(LCase(fieldValue)) & "(String " & (fieldValue) & ") {"
        Print #1, WK_Str
        
        'return
        WK_Str = "        this." & LCase(fieldValue) & " = " & (fieldValue) & ";"
        Print #1, WK_Str
            
        'Other
        Print #1, "    }"
        Print #1, " "
    Next i
    
    Print #1, "}"
    
    Close #1
      
    '画面事件响应（单画面）
    Call CreatController
    '系统业务逻辑
    Call CreatService
    '数据操作实体（单表）
    Call CreatDao
    
    MsgBox ("OK")
    Exit Sub
    
Open_Error:
    MsgBox ("Error")
End Sub
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub CreatController()
        
On Error GoTo Open_Error
    
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Open sfileName & "Controller.java" For Output Shared As #1
    
    Print #1, "import javax.annotation.Resource;"
    Print #1, ""
    
    Print #1, "import org.slf4j.Logger;"
    Print #1, "import org.slf4j.LoggerFactory;"
    Print #1, "import org.springframework.stereotype.Controller;"
        
    Print #1, ""
    Print #1, "@Controller"
    Print #1, "/** " & Trim(Cells(1, 31).Value) & "*/"
    Print #1, "public class " & sdbname & "Controller extends MyControllerSupport {"
    Print #1, "    protected static final Logger logger = LoggerFactory.getLogger(" & sdbname & "Controller.class);"
    Print #1, "    @Resource"
    Print #1, "    protected " & sdbname & "Service " & sdbname & "Service_;"
    Print #1, ""
    Print #1, "    public MyModelAndViewSupport getModelAndView(){"
    Print #1, "        return new MyModelAndViewSupport(""" & sdbname & """);"
    Print #1, "    }"
    Print #1, ""
    Print #1, "}"
        
    Close #1
    
    Exit Sub
Open_Error:
    MsgBox ("文件做成失败" & Chr(13) & _
        "请再次运行")
End Sub
Sub CreatService()
        
On Error GoTo Open_Error
    
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Open sfileName & "Service.java" For Output Shared As #1
    
    Print #1, "import org.springframework.stereotype.Service;"
    Print #1, "import org.slf4j.Logger;"
    Print #1, "import org.slf4j.LoggerFactory;"
    Print #1, ""
    Print #1, "/** " & Trim(Cells(1, 31).Value) & "*/"
    Print #1, "@Service"
    Print #1, "public class " & sdbname & "Service extends MyServiceSupport {"
    Print #1, "    protected static final Logger logger = LoggerFactory.getLogger(" & sdbname & "Service.class);"
    Print #1, ""
    Print #1, "    public " & sdbname & "Dao getDao(){"
    Print #1, "        return getMySqlSession().getMapper(" & sdbname & "Dao.class);"
    Print #1, "    }"
    Print #1, ""
    Print #1, "}"
        
    Close #1
    
    Exit Sub
Open_Error:
    MsgBox ("文件做成失败" & Chr(13) & _
        "请再次运行")
End Sub
Sub CreatDao()
        
On Error GoTo Open_Error
    
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Open sfileName & "Dao.java" For Output Shared As #1

    Print #1, "/** " & Trim(Cells(1, 31).Value) & "*/"
    Print #1, "public interface " & sdbname & "Dao extends ISDatabaseSupport{"
    Print #1, ""
    Print #1, "}"
        
    Close #1
    
    Exit Sub
Open_Error:
    MsgBox ("文件做成失败" & Chr(13) & _
        "请再次运行")
End Sub
''''''''''''''''''''''''
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Sub CreatEntity()

     SYSNAME = Cells(1, 52).Value
    spgname = Cells(1, 31).Value
    sdbname = SYSNAME & Cells(1, 62).Value
    sver = Cells(4, 78).Value
       
    sfxdate = Format(Date, "YYYY/MM/DD")

    sfileName = Application.GetSaveAsFilename(InitialFilename:=sdbname & "", _
                          fileFilter:="java  , *.java")
    
    If sfileName = "" Or sfileName = "False" Then
        MsgBox ("File Name")
        Exit Sub
    End If
        
On Error GoTo Open_Error
    
    Const OBJ_EXT = ".JAVA"
    If UCase(Right(sfileName, Len(OBJ_EXT))) = OBJ_EXT Then
        sfileName = Left(sfileName, Len(sfileName) - Len(OBJ_EXT))
    End If
    
    Dim sKeyName As String
    Dim index As Integer
    
    sKeyName = sfileName
    index = InStr(sKeyName, "\")
    While index > 0
        sKeyName = Mid(sKeyName, index + 1)
        index = InStr(sKeyName, "\")
    Wend
    
    Open sfileName & "ET" & ".java" For Output Shared As #1
    
    '-------------------------------
    ' 头注释
    '-------------------------------
    'Print #1, "/*++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    'Print #1, " * System Name        : " & spgname
    'Print #1, " * File Name          : " & sKeyName & ".java"
    'Print #1, " * Compiler           : JDK1.6"
    'Print #1, " *++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/"
    Print #1, "package org.jfp.business.;"
    Print #1, " "
    Print #1, "import javax.inject.Named;"
    Print #1, "import org.jfp.framework.support.MyDaoSupport;"
    Print #1, " "
    Print #1, "@Named"
    Print #1, "/** " & Trim(Cells(1, 31).Value) & "*/"
    Print #1, "public class " & sdbname & "DO extends MyDaoSupport"
    
    Print #1, "{"

    Dim WK_Str      As String
    Dim i           As Integer
    Dim strKeyName      As String
      
    Application.ScreenUpdating = False
        
    'field
    For i = dataStartLine + 1 To dataEndLine
        WK_Str = ""
        If Not getEntityValue(i) Then
            Exit For
        End If
        '/**********项目设置**********/
        'Print #1, "    /** "
        'Print #1, "     * " & itemValue
        'Print #1, "     */"
            
        fieldValue = LCase(fieldValue)
            
        '懏� 
        'String
        WK_Str = "    public String " & (fieldValue) & " { get; set; }"
            
        Print #1, WK_Str
        Print #1, " "
    Next i

    Print #1, "}"
    
    Close #1
    
    MsgBox ("OK")
    Exit Sub
    
Open_Error:
    MsgBox ("Error")
End Sub



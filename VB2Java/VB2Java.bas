Attribute VB_Name = "VB2Java"
Sub GenerateJava(FormName As Form)
    Dim c As New StringBuffer
    Load FormName
    fName = FormName.Name
    FormName.ScaleMode = 1
    c.appendln "import javax.swing.*;"
    c.appendln "import javax.swing.event.*;"
    c.appendln "import java.awt.event.*;"
    c.appendln "import java.awt.*;"
    c.appendln
    c.appendln "class " + fName + "Frame extends JFrame {"
    c.appendln
    c.appendln "    private Toolkit tk = Toolkit.getDefaultToolkit();"
    c.appendln "    Container contentPane=null;"
    c.appendln "    ButtonGroup " + fName + "ButtonGroup = new ButtonGroup();"
    c.appendln
    c.appendln "        JMenuBar menuBar = new JMenuBar();"
    
    Dim Menu As New CMenu
    Menu.GetFormMenu FormName
    c.appendln DeclareMenu(Menu)
    
    'c.appendln "        JFrame " + fName + " = null;"
    Dim obj As Control
    For Each obj In FormName.Controls
        'Set obj = FormName.Controls.Item(i)
        'A = obj.Left
        If TypeOf obj Is CommandButton Then
            c.appendln "        JButton " + obj.Name + "= null;"

        ElseIf TypeOf obj Is TextBox Then
            If obj.MultiLine = False Then
                c.appendln "        JTextField " + obj.Name + "= null;"
            Else
                c.appendln "        JTextArea " + obj.Name + "= null;"
            End If
        ElseIf TypeOf obj Is Label Then
            c.appendln "        JLabel " + obj.Name + "= null;"
        ElseIf TypeOf obj Is CheckBox Then
            c.appendln "        JCheckBox " + obj.Name + "= null;"
        ElseIf TypeOf obj Is OptionButton Then
            c.appendln "        JRadioButton " + obj.Name + "= null;"
        ElseIf TypeOf obj Is Frame Then
            c.appendln "        JPanel " + obj.Name + "= null;"
            c.appendln "        ButtonGroup " + obj.Name + "ButtonGroup = new ButtonGroup();"
        ElseIf TypeOf obj Is ListBox Then
            c.appendln "        JList " + obj.Name + "= null;"
        ElseIf TypeOf obj Is ComboBox Then
            c.appendln "        JComboBox " + obj.Name + "= null;"
        ElseIf TypeOf obj Is PictureBox Then
            c.appendln "        JPanel " + obj.Name + "= null;"
        Else
        End If
    Next
    c.appendln
    
    
    c.appendln
    c.appendln "    public " + fName + "Frame() {"
    c.appendln "        try {"
    c.appendln "            //UIManager.setLookAndFeel(""javax.swing.plaf.metal.MetalLokkAndFeel"");"
    c.appendln "            //UIManager.setLookAndFeel(""com.sun.java.swing.plaf.motif.MotifLookAndFeel"");"
    c.appendln "            UIManager.setLookAndFeel(""com.sun.java.swing.plaf.windows.WindowsLookAndFeel"");"
    c.appendln "            SwingUtilities.updateComponentTreeUI(this);"
    c.appendln "        } catch(Exception ex) {}"
    c.appendln
    c.appendln "        setTitle(""" + fName + """);"
    If Menu.SubMenuCount > 0 Then
        c.appendln "        setSize(" + CStr(FormName.ScaleWidth \ 15 + 8) + ", " + Format(FormName.ScaleHeight \ 15 + 27 + 19) + ");"
    Else
        c.appendln "        setSize(" + CStr(FormName.ScaleWidth \ 15 + 8) + ", " + Format(FormName.ScaleHeight \ 15 + 27) + ");"
    End If
    c.appendln "        //setLocation(" + CStr(FormName.Left \ 15) + ", " + Format(FormName.Top \ 15) + ");"
    c.appendln
    Dim WList As New Collection
    WList.Add "windowClosing"
    WList.Add "windowOpened"
    WList.Add "windowOpening"
    WList.Add "windowIconified"
    WList.Add "windowDeiconified"
    WList.Add "windowClosed"
    WList.Add "windowActivated"
    WList.Add "windowDeactivated"
    c.appendln addListener(fName + "Frame", "WindowListener", WList, "WindowEvent")
    
    Dim MList As New Collection
    MList.Add "mousePressed"
    MList.Add "mouseReleased"
    MList.Add "mouseEntered"
    MList.Add "mouseExited"
    MList.Add "mouseClicked"
    c.appendln addListener(fName + "Frame", "MouseListener", MList, "MouseEvent")
    
    Dim MMList As New Collection
    MMList.Add "mouseMoved"
    MMList.Add "mouseDragged"
    c.appendln addListener(fName + "Frame", "MouseMotionListener", MMList, "MouseEvent")
    
    Dim KList As New Collection
    KList.Add "keyPressed"
    KList.Add "keyReleased"
    KList.Add "keyTyped"
    c.appendln addListener(fName + "Frame", "KeyListener", KList, "KeyEvent")
    
    Dim FList As New Collection
    FList.Add "focusGained"
    FList.Add "focusLost"
    c.appendln addListener(fName + "Frame", "FocusListener", FList, "FocusEvent")
    
    Dim AList As New Collection
    AList.Add "actionPerformed"
    
    Dim DList As New Collection
    DList.Add "changedUpdate"
    DList.Add "insertUpdate"
    DList.Add "removeUpdate"
    
    Dim IList As New Collection
    IList.Add "itemStateChanged"
    
    Dim TList As New Collection
    TList.Add "textValueChanged"
    
    Dim LList As New Collection
    LList.Add "valueChanged"
    
    
    Dim TextFieldDefaultManagerCode As New StringBuffer
    TextFieldDefaultManagerCode.appendln "        /*String text = null;"
    TextFieldDefaultManagerCode.appendln "        try {"
    TextFieldDefaultManagerCode.appendln "            text = e.getDocument().getText(0,e.getDocument().getLength());"
    TextFieldDefaultManagerCode.appendln "        } catch(Exception ex) {} */"
    
    Dim MouseClickManagerCode As New StringBuffer
    MouseClickManagerCode.appendln "        //int clickCount = e.getClickCount();"
    MouseClickManagerCode.appendln "        //int x = e.getX();"
    MouseClickManagerCode.appendln "        //int y = e.getY();"
    MouseClickManagerCode.appendln "        //boolean lButton = (e.getModifier() & InputEvent.BUTTON1_MASK);"
    MouseClickManagerCode.appendln "        //boolean rButton = (e.getModifier() & InputEvent.BUTTON3_MASK);"
    MouseClickManagerCode.appendln "        //boolean shift = e.isShiftDown();"
    MouseClickManagerCode.appendln "        //boolean alt = e.isAltDown();"
    MouseClickManagerCode.appendln "        //boolean ctrl = e.isControlDown();"
    MouseClickManagerCode.appendln "        //boolean meta = e.isMetaDown();"
    
    
    Dim ActionManagerCode As New StringBuffer
    ActionManagerCode.appendln "        //BUTTON CODE"
    ActionManagerCode.appendln "        //Object Source=e.getSource();"
    ActionManagerCode.appendln "        //String ActionCommand=e.getActionCommand();"
    
    
    Dim KeyManagerCode As New StringBuffer
    KeyManagerCode.appendln "        "
    
    c.appendln
    c.appendln "        contentPane=getContentPane();"
    c.appendln "        contentPane.setLayout(null);"
    
    
    c.appendln
    c.appendln DefineMenu(Menu)
    c.appendln "        setJMenuBar(menuBar);"
    c.appendln
    
    For Each obj In FormName.Controls
        'Set obj = FormName.Controls.Item(i)
        'A = obj.Left
        If TypeOf obj Is CommandButton Then
            c.appendln
            c.appendln "        " + obj.Name + "= new JButton(""" + obj.Caption + """);"
            c.appendln "        " + obj.Name + ".setSize(" + CStr(obj.Width \ 15) + "," + CStr(obj.Height \ 15) + ");"
            c.appendln "        "
            'c.appendln "        " + obj.Name + ".addActionListener(new ActionListener() {"
            c.appendln addListener(obj.Name, "ActionListener", AList, "ActionEvent")
            c.appendln addListener(obj.Name, "FocusListener", FList, "FocusEvent")
            c.appendln addListener(obj.Name, "MouseListener", MList, "MouseEvent")
            c.appendln addListener(obj.Name, "MouseMotionListener", MMList, "MouseEvent")
            c.appendln addListener(obj.Name, "KeyListener", KList, "KeyEvent")
            c.appendln "        " + obj.Name + ".setLocation(" + CStr(obj.Left \ 15) + "," + CStr(obj.Top \ 15) + ");"
            If TypeOf obj.Container Is Form Then
                'c.appendln "        " + obj.Name + ".setLocation(" + CStr(obj.Left \ 15) + "," + CStr(obj.Top \ 15) + ");"
                c.appendln "        contentPane.add(" + obj.Name + ");"
            Else
                'c.appendln "        " + obj.Name + ".setLocation(" + CStr(obj.Left \ 15 + obj.Container.Left \ 15) + "," + CStr(obj.Top \ 15 + obj.Container.Top \ 15) + ");"
                c.appendln "        " + obj.Container.Name + ".add(" + obj.Name + ");"
            End If
            
            c.appendln

        ElseIf TypeOf obj Is TextBox Then
            If obj.MultiLine = False Then
                c.appendln "        " + obj.Name + "= new JTextField(""" + obj.Text + """, " + CStr(Int(obj.Width / 20)) + ");"
                c.appendln "        " + obj.Name + ".setSize(" + CStr(obj.Width \ 15) + "," + CStr(obj.Height \ 15) + ");"
                c.appendln "        "
                c.appendln addListener(obj.Name, "DocumentListener", DList, "DocumentEvent", ".getDocument()")
                c.appendln "        contentPane.add(" + obj.Name + ");"
                c.appendln "        " + obj.Name + ".setLocation(" + CStr(obj.Left \ 15) + "," + CStr(obj.Top \ 15) + ");"
                If TypeOf obj.Container Is Form Then
                    c.appendln "        contentPane.add(" + obj.Name + ");"
                Else
                    c.appendln "        " + obj.Container.Name + ".add(" + obj.Name + ");"
                End If
            Else
                c.appendln "        " + obj.Name + "= new JTextArea(""" + obj.Text + """, " + CStr(Int(obj.Width / 20)) + "," + CStr(Int(obj.Height / 20)) + ");"
                c.appendln "        " + obj.Name + ".setLineWrap(true);"
                c.appendln "        " + obj.Name + ".setWrapStyleWord(true);"
                c.appendln "        " + obj.Name + ".setSize(" + CStr(obj.Width \ 15) + "," + CStr(obj.Height \ 15) + ");"
                c.appendln "        " + obj.Name + ".setLocation(0,0);"
                c.appendln "        JScrollPane SP_" + obj.Name + " = new JScrollPane(" + obj.Name + ");"
                'c.appendln "        SP_" + obj.Name + ".setLocation(" + CStr(obj.Left) + "," + CStr(obj.Top) + ");"
                c.appendln "        SP_" + obj.Name + ".setSize(" + CStr(obj.Width \ 15) + "," + CStr(obj.Height \ 15) + ");"
                c.appendln addListener(obj.Name, "DocumentListener", DList, "DocumentEvent", ".getDocument()")
                c.appendln "        SP_" + obj.Name + ".setLocation(" + CStr(obj.Left \ 15) + "," + CStr(obj.Top \ 15) + ");"
                If TypeOf obj.Container Is Form Then
                    c.appendln "        contentPane.add(SP_" + obj.Name + ");"
                Else
                    c.appendln "        " + obj.Container.Name + ".add(SP_" + obj.Name + ");"
                End If
                'c.appendln "        contentPane.add(SP_" + obj.Name + ");"
                
            End If
            c.appendln addListener(obj.Name, "FocusListener", FList, "FocusEvent")
            c.appendln addListener(obj.Name, "MouseListener", MList, "MouseEvent")
            c.appendln addListener(obj.Name, "MouseMotionListener", MMList, "MouseEvent")
            c.appendln addListener(obj.Name, "KeyListener", KList, "KeyEvent")
        ElseIf TypeOf obj Is Label Then
            c.appendln "        " + obj.Name + "= new JLabel(""" + obj.Caption + """,SwingConstants.LEFT);"
            c.appendln "        " + obj.Name + ".setSize(" + CStr(obj.Width \ 15) + "," + CStr(obj.Height \ 15) + ");"
            c.appendln "        " + obj.Name + ".setLocation(" + CStr(obj.Left \ 15) + "," + CStr(obj.Top \ 15) + ");"
            If TypeOf obj.Container Is Form Then
                c.appendln "        contentPane.add(" + obj.Name + ");"
            Else
                c.appendln "        " + obj.Container.Name + ".add(" + obj.Name + ");"
            End If
        ElseIf TypeOf obj Is CheckBox Then
            c.appendln "        " + obj.Name + "= new JCheckBox(""" + obj.Caption + """);"
            c.appendln "        " + obj.Name + ".setSize(" + CStr(obj.Width \ 15) + "," + CStr(obj.Height \ 15) + ");"
            c.appendln addListener(obj.Name, "ActionListener", AList, "ActionEvent")
            c.appendln addListener(obj.Name, "FocusListener", FList, "FocusEvent")
            c.appendln addListener(obj.Name, "MouseListener", MList, "MouseEvent")
            c.appendln addListener(obj.Name, "MouseMotionListener", MMList, "MouseEvent")
            c.appendln addListener(obj.Name, "KeyListener", KList, "KeyEvent")
            c.appendln "        " + obj.Name + ".setLocation(" + CStr(obj.Left \ 15) + "," + CStr(obj.Top \ 15) + ");"
            If TypeOf obj.Container Is Form Then
                c.appendln "        contentPane.add(" + obj.Name + ");"
            Else
                c.appendln "        " + obj.Container.Name + ".add(" + obj.Name + ");"
            End If
        ElseIf TypeOf obj Is OptionButton Then
            c.appendln "        " + obj.Name + "= new JRadioButton(""" + obj.Caption + """);"
            c.appendln "        " + obj.Name + ".setSize(" + CStr(obj.Width \ 15) + "," + CStr(obj.Height \ 15) + ");"
            c.appendln "        " + obj.Name + ".setLocation(" + CStr(obj.Left \ 15) + "," + CStr(obj.Top \ 15) + ");"
            If TypeOf obj.Container Is Form Then
                c.appendln "        " + fName + "ButtonGroup.add(" + obj.Name + ");"
                c.appendln "        contentPane.add(" + obj.Name + ");"
            Else
                c.appendln "        " + obj.Container.Name + "ButtonGroup.add(" + obj.Name + ");"
                c.appendln "        " + obj.Container.Name + ".add(" + obj.Name + ");"
            End If
            c.appendln addListener(obj.Name, "ActionListener", AList, "ActionEvent")
            c.appendln addListener(obj.Name, "FocusListener", FList, "FocusEvent")
            c.appendln addListener(obj.Name, "MouseListener", MList, "MouseEvent")
            c.appendln addListener(obj.Name, "MouseMotionListener", MMList, "MouseEvent")
            c.appendln addListener(obj.Name, "KeyListener", KList, "KeyEvent")
        ElseIf TypeOf obj Is Frame Then
            c.appendln "        " + obj.Name + "= new JPanel();"
            c.appendln "        " + obj.Name + ".setLayout(null);"
            c.appendln "        " + obj.Name + ".setSize(" + CStr(obj.Width \ 15) + "," + CStr(obj.Height \ 15) + ");"
            c.appendln "        " + obj.Name + ".setBorder(BorderFactory.createTitledBorder(BorderFactory.createEtchedBorder(),""" + obj.Caption + """));"
            c.appendln addListener(obj.Name, "FocusListener", FList, "FocusEvent")
            c.appendln addListener(obj.Name, "MouseListener", MList, "MouseEvent")
            c.appendln addListener(obj.Name, "MouseMotionListener", MMList, "MouseEvent")
            c.appendln addListener(obj.Name, "KeyListener", KList, "KeyEvent")
            c.appendln "        " + obj.Name + ".setLocation(" + CStr(obj.Left \ 15) + "," + CStr(obj.Top \ 15) + ");"
            If TypeOf obj.Container Is Form Then
                c.appendln "        contentPane.add(" + obj.Name + ");"
            Else
                c.appendln "        " + obj.Container.Name + ".add(" + obj.Name + ");"
            End If
        ElseIf TypeOf obj Is ListBox Then
            c.appendln "        " + obj.Name + "= new JList();"
            c.appendln "        //" + obj.Name + "= new JList(String[] StringList);"
            c.appendln "        " + obj.Name + ".setSize(" + CStr(obj.Width \ 15) + "," + CStr(obj.Height \ 15) + ");"
            c.appendln "        " + obj.Name + ".setLocation(0,0);"
            c.appendln "        JScrollPane SP_" + obj.Name + " = new JScrollPane(" + obj.Name + ");"
            c.appendln "        SP_" + obj.Name + ".setSize(" + CStr(obj.Width \ 15) + "," + CStr(obj.Height \ 15) + ");"
            
            c.appendln addListener(obj.Name, "ListSelectionListener", LList, "ListSelectionEvent", "")
            c.appendln addListener(obj.Name, "FocusListener", FList, "FocusEvent")
            c.appendln addListener(obj.Name, "MouseListener", MList, "MouseEvent")
            c.appendln addListener(obj.Name, "MouseMotionListener", MMList, "MouseEvent")
            c.appendln addListener(obj.Name, "KeyListener", KList, "KeyEvent")
            c.appendln "        SP_" + obj.Name + ".setLocation(" + CStr(obj.Left \ 15) + "," + CStr(obj.Top \ 15) + ");"
            If TypeOf obj.Container Is Form Then
                c.appendln "        contentPane.add(SP_" + obj.Name + ");"
            Else
                c.appendln "        " + obj.Container.Name + ".add(SP_" + obj.Name + ");"
            End If
        ElseIf TypeOf obj Is ComboBox Then
            c.appendln "        " + obj.Name + "= new JComboBox();"
            c.appendln "        " + obj.Name + ".setSize(" + CStr(obj.Width \ 15) + "," + CStr(obj.Height \ 15) + ");"
            c.appendln "        " + obj.Name + ".setEditable(true);               // to be a real combined box"
            c.appendln addListener(obj.Name, "ActionListener", AList, "ActionEvent")
            c.appendln addListener(obj.Name, "FocusListener", FList, "FocusEvent")
            c.appendln addListener(obj.Name, "MouseListener", MList, "MouseEvent")
            c.appendln addListener(obj.Name, "MouseMotionListener", MMList, "MouseEvent")
            c.appendln addListener(obj.Name, "KeyListener", KList, "KeyEvent")
            c.appendln "        " + obj.Name + ".setLocation(" + CStr(obj.Left \ 15) + "," + CStr(obj.Top \ 15) + ");"
            If TypeOf obj.Container Is Form Then
                c.appendln "        contentPane.add(" + obj.Name + ");"
            Else
                c.appendln "        " + obj.Container.Name + ".add(" + obj.Name + ");"
            End If
        ElseIf TypeOf obj Is PictureBox Then
            'c.appendln "        " + obj.Name + "= new JPanel();"
            
            c.appendln "        " + obj.Name + "= new JPanel() {"
            c.appendln "            public void paintComponent(Graphics g) {"
            c.appendln "                " + obj.Name + "_PAINT(g);"
            c.appendln "            }"
            c.appendln "        };"
            
            c.appendln "        " + obj.Name + ".setSize(" + CStr(obj.Width \ 15) + "," + CStr(obj.Height \ 15) + ");"
            c.appendln "        " + obj.Name + ".setBorder(BorderFactory.createTitledBorder(BorderFactory.createLoweredBevelBorder(),""""));"
            c.appendln addListener(obj.Name, "FocusListener", FList, "FocusEvent")
            c.appendln addListener(obj.Name, "MouseListener", MList, "MouseEvent")
            c.appendln addListener(obj.Name, "MouseMotionListener", MMList, "MouseEvent")
            c.appendln addListener(obj.Name, "KeyListener", KList, "KeyEvent")
            c.appendln "        " + obj.Name + ".setLocation(" + CStr(obj.Left \ 15) + "," + CStr(obj.Top \ 15) + ");"
            If TypeOf obj.Container Is Form Then
                c.appendln "        contentPane.add(" + obj.Name + ");"
            Else
                c.appendln "        " + obj.Container.Name + ".add(" + obj.Name + ");"
            End If
        Else
        End If
        
    Next
    c.appendln "        " + FormName.Name + "Frame_Load();"
    c.appendln "    }"
    
    c.appendln
    c.appendln
    
    c.appendln "    public void " + FormName.Name + "Frame_Load() {"
    c.appendln "    }"
    c.appendln addManager(fName + "Frame", "WindowListener", WList, "WindowEvent")
    c.appendln addManager(fName + "Frame", "MouseListener", MList, "MouseEvent", MouseClickManagerCode.value)
    c.appendln addManager(fName + "Frame", "MouseMotionListener", MMList, "MouseEvent", MouseClickManagerCode.value)
    c.appendln addManager(fName + "Frame", "KeyListener", KList, "KeyEvent")
    c.appendln addManager(fName + "Frame", "FocusListener", FList, "FocusEvent")
    
    c.appendln ManageMenu(Menu)

    
    For Each obj In FormName.Controls
        'A = obj.Left
        If TypeOf obj Is CommandButton Then
            c.appendln addManager(obj.Name, "ActionListener", AList, "ActionEvent")
            c.appendln addManager(obj.Name, "MouseListener", MList, "MouseEvent", MouseClickManagerCode.value)
            c.appendln addManager(obj.Name, "MouseMotionListener", MMList, "MouseEvent", MouseClickManagerCode.value)
            c.appendln addManager(obj.Name, "KeyListener", KList, "KeyEvent")
            c.appendln addManager(obj.Name, "FocusListener", FList, "FocusEvent")
        ElseIf TypeOf obj Is TextBox Then
            c.appendln addManager(obj.Name, "DocumentListener", DList, "DocumentEvent", TextFieldDefaultManagerCode.value)
            c.appendln addManager(obj.Name, "FocusListener", FList, "FocusEvent")
            c.appendln addManager(obj.Name, "ActionListener", AList, "ActionEvent")
            c.appendln addManager(obj.Name, "KeyListener", KList, "KeyEvent")
            c.appendln addManager(obj.Name, "MouseListener", MList, "MouseEvent", MouseClickManagerCode.value)
            c.appendln addManager(obj.Name, "MouseMotionListener", MMList, "MouseEvent", MouseClickManagerCode.value)
        ElseIf TypeOf obj Is Label Then
        ElseIf TypeOf obj Is CheckBox Then
            c.appendln addManager(obj.Name, "ActionListener", AList, "ActionEvent")
            c.appendln addManager(obj.Name, "FocusListener", FList, "FocusEvent")
            c.appendln addManager(obj.Name, "KeyListener", KList, "KeyEvent")
            c.appendln addManager(obj.Name, "MouseListener", MList, "MouseEvent", MouseClickManagerCode.value)
            c.appendln addManager(obj.Name, "MouseMotionListener", MMList, "MouseEvent", MouseClickManagerCode.value)
        ElseIf TypeOf obj Is OptionButton Then
            c.appendln addManager(obj.Name, "ActionListener", AList, "ActionEvent")
            c.appendln addManager(obj.Name, "FocusListener", FList, "FocusEvent")
            c.appendln addManager(obj.Name, "KeyListener", KList, "KeyEvent")
            c.appendln addManager(obj.Name, "MouseListener", MList, "MouseEvent", MouseClickManagerCode.value)
            c.appendln addManager(obj.Name, "MouseMotionListener", MMList, "MouseEvent", MouseClickManagerCode.value)
        ElseIf TypeOf obj Is Frame Then
            c.appendln addManager(obj.Name, "FocusListener", FList, "FocusEvent")
            c.appendln addManager(obj.Name, "KeyListener", KList, "KeyEvent")
            c.appendln addManager(obj.Name, "MouseListener", MList, "MouseEvent", MouseClickManagerCode.value)
            c.appendln addManager(obj.Name, "MouseMotionListener", MMList, "MouseEvent", MouseClickManagerCode.value)
        ElseIf TypeOf obj Is ListBox Then
            c.appendln addManager(obj.Name, "ListSelectionListener", LList, "ListSelectionEvent")
            c.appendln addManager(obj.Name, "MouseListener", MList, "MouseEvent", MouseClickManagerCode.value)
            c.appendln addManager(obj.Name, "MouseMotionListener", MMList, "MouseEvent", MouseClickManagerCode.value)
            c.appendln addManager(obj.Name, "KeyListener", KList, "KeyEvent")
            c.appendln addManager(obj.Name, "FocusListener", FList, "FocusEvent")
        ElseIf TypeOf obj Is ComboBox Then
            c.appendln addManager(obj.Name, "ActionListener", AList, "ActionEvent")
            c.appendln addManager(obj.Name, "MouseListener", MList, "MouseEvent", MouseClickManagerCode.value)
            c.appendln addManager(obj.Name, "MouseMotionListener", MMList, "MouseEvent", MouseClickManagerCode.value)
            c.appendln addManager(obj.Name, "KeyListener", KList, "KeyEvent")
            c.appendln addManager(obj.Name, "FocusListener", FList, "FocusEvent")
        ElseIf TypeOf obj Is PictureBox Then
            c.appendln ""
            c.appendln "    public void " + obj.Name + "_PAINT(Graphics g) {"
            c.appendln "        this.setTitle(""Painting"");"
            c.appendln "    }"
            c.appendln ""
            c.appendln addManager(obj.Name, "ActionListener", AList, "ActionEvent")
            c.appendln addManager(obj.Name, "MouseListener", MList, "MouseEvent", MouseClickManagerCode.value)
            c.appendln addManager(obj.Name, "MouseMotionListener", MMList, "MouseEvent", MouseClickManagerCode.value)
            c.appendln addManager(obj.Name, "KeyListener", KList, "KeyEvent")
            c.appendln addManager(obj.Name, "FocusListener", FList, "FocusEvent")
        ElseIf TypeOf obj Is Menu Then
        Else
        End If
    Next
    
    c.appendln
    c.appendln "    public static void main(String[] args) {"
    c.appendln "        JFrame " + fName + " = new " + fName + "Frame();"
    c.appendln "        " + fName + ".show();"
    c.appendln "    }"
    c.appendln "}"
    MsgBox c.value
    Clipboard.Clear
    Clipboard.SetText c.value
End Sub

Function addListener(ComponentName As String, Listenername As String, colEvent As Collection, EventName As String, Optional AddSuffix As String = "") As String
    Dim c As New StringBuffer
    If InStr(ComponentName, "Frame") = 0 Then
        c.appendln "        " + ComponentName + AddSuffix + ".add" + Listenername + " (new " + Listenername + "() {"
    Else
        c.appendln "        add" + Listenername + " (new " + Listenername + "() {"
    End If
    For i = 1 To colEvent.Count
        c.appendln "            public void " + colEvent(i) + "(" + EventName + " e){"
        c.appendln "                " + ComponentName + "_" + UCase(colEvent(i)) + "(e);"
        If colEvent(i) = "windowClosing" Then
            c.appendln "                System.exit(0);"
        End If
        c.appendln "            }"
    Next i
    c.appendln "        });"
    c.appendln
    addListener = c.value
End Function
Function addManager(ComponentName As String, Listenername As String, colEvent As Collection, EventName As String, Optional DefaultManagerCode As String = "") As String
    Dim c As New StringBuffer
    For i = 1 To colEvent.Count
        c.appendln "    public void " + ComponentName + "_" + UCase(colEvent(i)) + "(" + EventName + " e){"
        If DefaultManagerCode = "" Then
            c.appendln "        this.setTitle(""" + ComponentName + "_" + UCase(colEvent(i)) + """);"
        Else
            c.appendln DefaultManagerCode
            c.appendln "        this.setTitle(""" + ComponentName + "_" + UCase(colEvent(i)) + """);"
        End If
        c.appendln "    }"
    Next i
    c.appendln
    addManager = c.value
End Function

Function DeclareMenu(Menu As CMenu) As String
    resstr = ""
    For i = 1 To Menu.SubMenuCount
        MenuName = Menu.SubMenu(i).Text
        If Menu.SubMenu(i).SubMenuCount > 0 Then
            resstr = resstr + "        JMenu mnu" + MenuName + " = null;" + vbCrLf
            resstr = resstr + DeclareMenu(Menu.SubMenu(i))
        Else
            resstr = resstr + "        JMenuItem mnu" + MenuName + " = null;" + vbCrLf
        
        End If

        'resstr = resstr + "   mnu" + Menu.Text + ".add(mnu" + MenuName + ");" + vbCrLf
        'resstr = resstr + "   JMenu mnu" + MenuName + " = new JMenu(""" + MenuName + """);" + vbCrLf
        'resstr = resstr + "   JMenuItem mnu" + MenuName + " = new JMenuItem(""" + MenuName + """);" + vbCrLf

    Next i
    DeclareMenu = Replace(resstr, "&", "")
End Function
Function DefineMenu(Menu As CMenu) As String
    resstr = ""
    For i = 1 To Menu.SubMenuCount
        MenuName = Menu.SubMenu(i).Text
        If Menu.SubMenu(i).SubMenuCount > 0 Then
            resstr = resstr + "         mnu" + MenuName + " = new JMenu(""" + MenuName + """);" + vbCrLf
            If Menu.ParentMenuID > 0 Then
                resstr = resstr + "         mnu" + Menu.Text + ".add(""mnu" + MenuName + """);" + vbCrLf
                resstr = resstr + DefineMenu(Menu.SubMenu(i))
            Else
                resstr = resstr + "         menuBar.add(mnu" + MenuName + ");" + vbCrLf
                resstr = resstr + DefineMenu(Menu.SubMenu(i))
            End If
        Else
            resstr = resstr + "         mnu" + MenuName + " = new JMenuItem(""" + MenuName + """);" + vbCrLf
            resstr = resstr + "         mnu" + MenuName + ".addActionListener(new ActionListener() {" + vbCrLf
            resstr = resstr + "             public void actionPerformed(ActionEvent e){" + vbCrLf
            resstr = resstr + "                 mnu" + MenuName + "_CLICK(e);" + vbCrLf
            resstr = resstr + "             }" + vbCrLf
            resstr = resstr + "         });" + vbCrLf
            resstr = resstr + "         mnu" + Menu.Text + ".add(mnu" + MenuName + ");" + vbCrLf
            
        End If

        'resstr = resstr + "   mnu" + Menu.Text + ".add(mnu" + MenuName + ");" + vbCrLf
        'resstr = resstr + "   JMenu mnu" + MenuName + " = new JMenu(""" + MenuName + """);" + vbCrLf
        'resstr = resstr + "   JMenuItem mnu" + MenuName + " = new JMenuItem(""" + MenuName + """);" + vbCrLf

    Next i
    DefineMenu = Replace(resstr, "&", "")
End Function
Function ManageMenu(Menu As CMenu) As String
    resstr = ""
    For i = 1 To Menu.SubMenuCount
        MenuName = Menu.SubMenu(i).Text
        If Menu.SubMenu(i).SubMenuCount > 0 Then
            resstr = resstr + ManageMenu(Menu.SubMenu(i))
        Else
            resstr = resstr + "    public void mnu" + MenuName + "_CLICK(ActionEvent e) {" + vbCrLf
            resstr = resstr + "         this.setTitle(""mnu" + MenuName + "_CLICK"");" + vbCrLf

            resstr = resstr + "    }" + vbCrLf
        End If
    Next i
    ManageMenu = Replace(resstr, "&", "")
End Function

Sub main()
    GenerateJava Form1
    'GenerateJava MessageWindow
    End
End Sub

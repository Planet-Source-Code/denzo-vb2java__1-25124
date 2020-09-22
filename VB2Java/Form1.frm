VERSION 5.00
Begin VB.Form Form1 
   ClientHeight    =   5190
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   7125
   LinkTopic       =   "Form1"
   ScaleHeight     =   346
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   475
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame3 
      Caption         =   "Frame3"
      Height          =   1815
      Left            =   1560
      TabIndex        =   16
      Top             =   3360
      Width           =   3135
      Begin VB.Frame Frame4 
         Caption         =   "Frame4"
         Height          =   1455
         Left            =   240
         TabIndex        =   17
         Top             =   240
         Width           =   2775
         Begin VB.CommandButton Command2 
            Caption         =   "Command2"
            Height          =   615
            Left            =   360
            TabIndex        =   19
            Top             =   720
            Width           =   1815
         End
         Begin VB.ComboBox Combo1 
            Height          =   315
            ItemData        =   "Form1.frx":0000
            Left            =   360
            List            =   "Form1.frx":0002
            TabIndex        =   18
            Text            =   "Combo1"
            Top             =   240
            Width           =   1815
         End
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Frame2"
      Height          =   2775
      Left            =   3480
      TabIndex        =   12
      Top             =   120
      Width           =   1935
      Begin VB.CommandButton Command3 
         Caption         =   "Command3"
         Height          =   975
         Left            =   240
         TabIndex        =   15
         Top             =   1560
         Width           =   1335
      End
      Begin VB.CommandButton Command4 
         Caption         =   "Command4"
         Height          =   495
         Left            =   240
         TabIndex        =   14
         Top             =   240
         Width           =   1335
      End
      Begin VB.CommandButton Command5 
         Caption         =   "Command5"
         Height          =   495
         Left            =   240
         TabIndex        =   13
         Top             =   960
         Width           =   1335
      End
   End
   Begin VB.PictureBox Picture1 
      Height          =   2295
      Left            =   1920
      ScaleHeight     =   2235
      ScaleWidth      =   1395
      TabIndex        =   11
      Top             =   120
      Width           =   1455
   End
   Begin VB.ListBox List1 
      Height          =   1425
      Left            =   120
      TabIndex        =   8
      Top             =   3480
      Width           =   1335
   End
   Begin VB.Frame Frame1 
      Caption         =   "Frame1"
      Height          =   1335
      Left            =   5520
      TabIndex        =   7
      Top             =   240
      Width           =   1575
      Begin VB.OptionButton Option5 
         Caption         =   "Option5"
         Height          =   375
         Left            =   480
         TabIndex        =   10
         Top             =   840
         Width           =   975
      End
      Begin VB.OptionButton Option4 
         Caption         =   "Option4"
         Height          =   255
         Left            =   240
         TabIndex        =   9
         Top             =   360
         Width           =   1215
      End
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Option1"
      Height          =   375
      Left            =   240
      TabIndex        =   5
      Top             =   1680
      Width           =   1575
   End
   Begin VB.CheckBox Check1 
      Caption         =   "Check1"
      Height          =   375
      Left            =   6000
      TabIndex        =   4
      Top             =   2280
      Width           =   975
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   120
      TabIndex        =   2
      Text            =   "Text2"
      Top             =   3000
      Width           =   6855
   End
   Begin VB.TextBox Text1 
      Height          =   1335
      Left            =   120
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "Form1.frx":0004
      Top             =   120
      Width           =   1695
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   375
      Left            =   1920
      TabIndex        =   0
      Top             =   2520
      Width           =   1455
   End
   Begin VB.Label Label2 
      Caption         =   "Label2"
      Height          =   495
      Left            =   5160
      TabIndex        =   6
      Top             =   4320
      Width           =   1575
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   375
      Left            =   4800
      TabIndex        =   3
      Top             =   3600
      Width           =   2055
   End
   Begin VB.Menu mnuFile 
      Caption         =   "&File"
      Begin VB.Menu mnuPippo 
         Caption         =   "Pippo"
      End
      Begin VB.Menu mnuPluto 
         Caption         =   "Pluto"
      End
   End
   Begin VB.Menu mnuPappo 
      Caption         =   "Pappo"
      Begin VB.Menu mnuPrrrr 
         Caption         =   "prrrr"
      End
   End
   Begin VB.Menu fbdz 
      Caption         =   "dgndzgn"
      Begin VB.Menu tfgyhu 
         Caption         =   "tyfvguh"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command5_Click()
    A$ = Command5.Left + Command5.Container.Left
End Sub


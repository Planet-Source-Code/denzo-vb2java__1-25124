VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CMenu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Dim lMenuID As Long
Dim lFormMenuID As Long
Dim lParentMenuID As Long
Dim lMenuIndex As Long

Dim MenuInfo As MENUITEMINFO

' Declare our functions that will
' be used to get and set some info
' about the menus
Private Declare Function GetMenu Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetMenuItemCount Lib "user32" (ByVal hMenu As Long) As Long
Private Declare Function GetMenuItemID Lib "user32" (ByVal hMenu As Long, ByVal nPos As Long) As Long
Private Declare Function GetMenuItemInfo Lib "user32" Alias "GetMenuItemInfoA" (ByVal hMenu As Long, ByVal un As Long, ByVal b As Long, lpMenuItemInfo As MENUITEMINFO) As Long
Private Declare Function GetMenuString Lib "user32" Alias "GetMenuStringA" (ByVal hMenu As Long, ByVal wIDItem As Long, ByVal lpString As String, ByVal nMaxCount As Long, ByVal wFlag As Long) As Long
Private Declare Function GetSubMenu Lib "user32" (ByVal hMenu As Long, ByVal nPos As Long) As Long
Private Declare Function SetMenuItemBitmaps Lib "user32" (ByVal hMenu As Long, ByVal nPosition As Long, ByVal wFlags As Long, ByVal hBitmapUnchecked As Long, ByVal hBitmapChecked As Long) As Long

' Make a type that will hold the
' menu item info
Private Type MENUITEMINFO
    cbSize As Long
    fMask As Long
    fType As Long
    fState As Long
    wID As Long
    hSubMenu As Long
    hbmpChecked As Long
    hbmpUnchecked As Long
    dwItemData As Long
    dwTypeData As String
    cch As Long
End Type
Public Sub GetFormMenu(frmForm As Form)
    lngMenu& = GetMenu(frmForm.hwnd)
    lFormMenuID = lngMenu&
    lMenuID = lngMenu&
    lParentMenuID = 0
    lMenuIndex = 1
    lParentMenuID = -1
End Sub
Public Property Get ID() As Long
    ID = lMenuID
End Property
Public Property Let ID(ByVal MenuID As Long)
    lMenuID = MenuID
End Property
Public Property Let FormMenuID(ByVal MenuID As Long)
    lFormMenuID = MenuID
End Property
Public Property Let ParentMenuID(ByVal MenuID As Long)
    lParentMenuID = MenuID
End Property
Public Property Get ParentMenuID() As Long
    ParentMenuID = lParentMenuID
End Property
Public Property Let MenuIndex(ByVal Index As Long)
    lMenuIndex = Index
End Property
Public Property Get MenuIndex() As Long
    MenuIndex = lMenuIndex
End Property
Public Property Get SubMenuCount() As Long
    SubMenuCount = GetMenuItemCount(lMenuID)
End Property
Public Function SubMenu(ByVal Index As Long) As CMenu
    Dim NewMenu As New CMenu
    If GetMenuItemCount(GetSubMenu(lMenuID, Index - 1)) > 0 Then
        NewMenu.ID = GetSubMenu(lMenuID, Index - 1)
    Else
        NewMenu.ID = GetMenuItemID(lMenuID, Index - 1)
    End If
    'NewMenu.ID = GetMenuItemID(GetSubMenu(lMenuID, Index - 1))
    NewMenu.FormMenuID = lFormMenuID
    Set SubMenu = NewMenu
End Function
Public Property Get Text() As String
    strMenuItemText$ = String(256, Chr(0))
    Call GetMenuString(lFormMenuID, lMenuID, strMenuItemText$, 256, 0&)
    Text = Left(strMenuItemText$, InStr(strMenuItemText$, Chr(0)) - 1)
End Property
Public Sub AddMenuImage(imgBitmapUCHK As Object, imgBitmapCHK As Object)
    Call SetMenuItemBitmaps(lFormMenuID, lMenuID, 0&, imgBitmapUCHK.Picture, imgBitmapCHK.Picture)
End Sub
Public Sub RemoveMenuImage()
    Call SetMenuItemBitmaps(lFormMenuID, lMenuID, 0&, 0&, 0&)
End Sub


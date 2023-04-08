#tag MobileContainer
Begin MobileContainer BHImagesButton
   AccessibilityHint=   ""
   AccessibilityLabel=   ""
   Compatibility   =   ""
   Device = 1
   Height          =   122
   Left            =   0
   Orientation = 0
   Top             =   0
   Visible         =   True
   Width           =   106
   Begin MobileLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      Alignment       =   ""
      AutoLayout      =   Label1, 1, ImageView1, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 38, , True
      AutoLayout      =   Label1, 4, <Parent>, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Label1, 2, ImageView1, 2, False, +1.00, 1, 1, 0, , True
      Enabled         =   True
      Height          =   38
      Left            =   0
      LineBreakMode   =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "LABEL"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   84
      Visible         =   True
      Width           =   106
   End
   Begin MobileImageViewer ImageView1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ImageView1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   ImageView1, 4, <Parent>, 4, False, +1.00, 1, 1, -38, , True
      AutoLayout      =   ImageView1, 3, <Parent>, 3, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   ImageView1, 2, <Parent>, 2, False, +1.00, 1, 1, 0, , True
      DisplayMode     =   ""
      Enabled         =   True
      Height          =   84
      Image           =   0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Top             =   0
      Visible         =   True
      Width           =   106
   End
   Begin MobileCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Canvas1, 3, ImageView1, 3, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Canvas1, 4, Label1, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Canvas1, 2, ImageView1, 2, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Canvas1, 1, ImageView1, 1, False, +1.00, 1, 1, 0, , True
      Enabled         =   True
      Height          =   122
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Top             =   0
      Visible         =   True
      Width           =   106
   End
End
#tag EndMobileContainer

#tag WindowCode
	#tag Method, Flags = &h0
		Sub Action()
		  RaiseEvent Action
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  ImageView1.Image = value
			End Set
		#tag EndSetter
		Image As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  Label1.Text = value
			End Set
		#tag EndSetter
		Label As String
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub PointerUp(position As Point, pointerInfo() As PointerEvent)
		  self.Action
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="TintColor"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="ColorGroup"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ControlCount"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="UI Control"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AccessibilityHint"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AccessibilityLabel"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Label"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Text"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior

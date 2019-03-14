#tag IOSContainerControl
Begin iOSContainerControl BHImagesButton
   AccessibilityHint=   ""
   AccessibilityLabel=   ""
   Compatibility   =   ""
   Height          =   122.0
   Left            =   0.0
   Top             =   0.0
   Visible         =   True
   Width           =   106.0
   Begin iOSLabel Label1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Label1, 1, ImageView1, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Label1, 8, , 0, False, +1.00, 1, 1, 38, , True
      AutoLayout      =   Label1, 4, <Parent>, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Label1, 2, ImageView1, 2, False, +1.00, 1, 1, 0, , True
      Enabled         =   True
      Height          =   38.0
      Left            =   0
      LineBreakMode   =   "0"
      LockedInPosition=   False
      Scope           =   0
      Text            =   "LABEL"
      TextAlignment   =   "1"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   84
      Visible         =   True
      Width           =   106.0
   End
   Begin iOSImageView ImageView1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ImageView1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   ImageView1, 4, <Parent>, 4, False, +1.00, 1, 1, -38, , True
      AutoLayout      =   ImageView1, 3, <Parent>, 3, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   ImageView1, 2, <Parent>, 2, False, +1.00, 1, 1, 0, , True
      ContentMode     =   "1"
      Height          =   84.0
      Image           =   "0"
      Image           =   "0"
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Top             =   0
      Visible         =   True
      Width           =   106.0
   End
   Begin iOSCanvas Canvas1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Canvas1, 3, ImageView1, 3, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Canvas1, 4, Label1, 4, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Canvas1, 2, ImageView1, 2, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   Canvas1, 1, ImageView1, 1, False, +1.00, 1, 1, 0, , True
      Height          =   122.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Top             =   0
      Visible         =   True
      Width           =   106.0
   End
End
#tag EndIOSContainerControl

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
		Image As iOSImage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  Label1.Text = value
			End Set
		#tag EndSetter
		Label As Text
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub PointerUp(pos As Xojo.Core.Point, eventInfo As iOSEventInfo)
		  self.Action
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AccessibilityHint"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AccessibilityLabel"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Group="Position"
		Type="Double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Label"
		Visible=true
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Group="Position"
		Type="Double"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Image"
		Group="Behavior"
		Type="iOSImage"
	#tag EndViewProperty
#tag EndViewBehavior

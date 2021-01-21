#tag Class
Protected Class BHButton
Inherits iOSButton
	#tag Event
		Sub Open()
		  
		  Declare Function NSClassFromString Lib "Foundation" (className As CFStringRef) As Ptr
		  Declare Function colorWithRGBA Lib "UIKit.framework" Selector "colorWithRed:green:blue:alpha:" ( UIColorClassRef As Ptr, red As CGFloat, green As CGFloat, blue As CGFloat, alpha As CGFloat) As Ptr
		  Declare Function view Lib "UIKit.framework" Selector "view" (UIViewController As Ptr) As Ptr
		  Declare Sub setBackgroundColor Lib "UIKit.framework" Selector "setBackgroundColor:" (UIView As Ptr, UIColor As Ptr)
		  
		  Dim UIColorClassPtr As Ptr =  NSClassFromString("UIColor")
		  Dim colorPtr As ptr = colorWithRGBA(UIColorClassPtr, (me.BackColor.red / 255.0), (me.BackColor.Green / 255.0), (me.BackColor.Blue / 255.0), (1.0-me.BackColor.Alpha/255.0))
		  Dim viewPtr As Ptr = me.Handle
		  SetBackgroundColor(viewPtr, colorPtr)
		  
		  Me.SetCornerRadiusXC(me.CornerRadius)
		  Me.TextColor = me.CaptionColor
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		BackColor As Color = &cEEEEEE
	#tag EndProperty

	#tag Property, Flags = &h0
		CaptionColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		CornerRadius As Integer = 8
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
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
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Double"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="ColorGroup"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccessibilityHint"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccessibilityLabel"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Caption"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Text"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaptionColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
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
			Name="BackColor"
			Visible=true
			Group="Behavior"
			InitialValue="&cEEEEEE"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CornerRadius"
			Visible=true
			Group="Behavior"
			InitialValue="8"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass

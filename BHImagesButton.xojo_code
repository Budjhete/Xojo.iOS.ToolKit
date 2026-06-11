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
   Begin MobileCanvas cButton
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AllowKeyEvents  =   False
      AutoLayout      =   cButton, 4, <Parent>, 4, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   cButton, 1, <Parent>, 1, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   cButton, 2, <Parent>, 2, False, +1.00, 4, 1, 0, , True
      AutoLayout      =   cButton, 3, <Parent>, 3, False, +1.00, 4, 1, 0, , True
      ControlCount    =   0
      Enabled         =   True
      Height          =   122
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      TintColor       =   &c000000
      Top             =   0
      Visible         =   True
      Width           =   106
      _ClosingFired   =   False
   End
End
#tag EndMobileContainer

#tag WindowCode
	#tag Event
		Sub Opening()
		  cButton.Refresh
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Action()
		  RaiseEvent Action
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Action()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEnabled = value
			  If Not mEnabled Then mPressed = False
			  cButton.Refresh
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mImage
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mImage = value
			  cButton.Refresh
			End Set
		#tag EndSetter
		Image As Picture
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mLabel
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLabel = value
			  cButton.AccessibilityLabel = value
			  cButton.Refresh
			End Set
		#tag EndSetter
		Label As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mEnabled As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLabel As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPressed As Boolean
	#tag EndProperty


#tag EndWindowCode

#tag Events cButton
	#tag Event
		Sub Paint(g As Graphics)
		  Dim backgroundColor As Color
		  Dim borderColor As Color
		  Dim textColor As Color

		  If Self.Enabled Then
		    If Color.IsDarkMode Then
		      backgroundColor = Color.RGB(34, 34, 36)
		      borderColor = Color.RGB(88, 88, 92)
		      textColor = Color.RGB(245, 245, 245)
		    Else
		      backgroundColor = Color.RGB(245, 245, 245)
		      borderColor = Color.RGB(218, 218, 218)
		      textColor = Color.RGB(0, 0, 0)
		    End If

		    If mPressed Then
		      If Color.IsDarkMode Then
		        backgroundColor = Color.RGB(70, 70, 74)
		        borderColor = Color.RGB(125, 125, 130)
		      Else
		        backgroundColor = Color.RGB(218, 218, 218)
		        borderColor = Color.RGB(185, 185, 185)
		      End If
		    End If
		  Else
		    If Color.IsDarkMode Then
		      backgroundColor = Color.RGB(48, 48, 50)
		      borderColor = Color.RGB(68, 68, 72)
		      textColor = Color.RGB(125, 125, 130)
		    Else
		      backgroundColor = Color.RGB(229, 229, 229)
		      borderColor = Color.RGB(212, 212, 212)
		      textColor = Color.RGB(160, 160, 160)
		    End If
		  End If

		  Dim offset As Double = 0.0
		  If Self.Enabled And mPressed Then offset = 1.0

		  g.DrawingColor = backgroundColor
		  g.FillRoundRectangle(0.0, offset, g.Width, g.Height - offset, 10.0, 10.0)

		  g.DrawingColor = borderColor
		  g.DrawRoundRectangle(0.5, offset + 0.5, g.Width - 1.0, g.Height - offset - 1.0, 10.0, 10.0)

		  Dim labelAreaHeight As Double = 36.0
		  Dim padding As Double = 8.0
		  Dim imageAreaHeight As Double = g.Height - labelAreaHeight - (padding * 2.0)

		  If mImage <> Nil And mImage.Width > 0 And mImage.Height > 0 And imageAreaHeight > 0.0 Then
		    Dim imageMaxWidth As Double = g.Width - (padding * 2.0)
		    Dim imageMaxHeight As Double = imageAreaHeight
		    Dim imageWidth As Double = mImage.Width
		    Dim imageHeight As Double = mImage.Height

		    If imageWidth > imageMaxWidth Or imageHeight > imageMaxHeight Then
		      Dim imageScale As Double = Min(imageMaxWidth / imageWidth, imageMaxHeight / imageHeight)
		      imageWidth = imageWidth * imageScale
		      imageHeight = imageHeight * imageScale
		    End If

		    Dim imageX As Double = (g.Width - imageWidth) / 2.0
		    Dim imageY As Double = padding + ((imageAreaHeight - imageHeight) / 2.0) + offset

		    If Self.Enabled Then
		      g.DrawPicture(mImage, imageX, imageY, imageWidth, imageHeight, 0.0, 0.0, mImage.Width, mImage.Height)
		    Else
		      g.Transparency = 55.0
		      g.DrawPicture(mImage, imageX, imageY, imageWidth, imageHeight, 0.0, 0.0, mImage.Width, mImage.Height)
		      g.Transparency = 0.0
		    End If
		  End If

		  If mLabel.Trim <> "" Then
		    g.DrawingColor = textColor

		    Dim textX As Double = padding
		    Dim textWidth As Double = g.Width - (padding * 2.0)
		    Dim textY As Double = g.Height - labelAreaHeight + ((labelAreaHeight - g.TextHeight) / 2.0) + g.TextHeight - 2.0 + offset
		    Dim textLine As String = mLabel

		    If g.TextWidth(textLine) > textWidth Then
		      While textLine.Length > 1 And g.TextWidth(textLine + "...") > textWidth
		        textLine = textLine.Left(textLine.Length - 1)
		      Wend

		      textLine = textLine + "..."
		    End If

		    g.DrawText(textLine, textX + ((textWidth - g.TextWidth(textLine)) / 2.0), textY)
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub PointerDown(position As Point, pointerInfo() As PointerEvent)
		  If Not Self.Enabled Then Return

		  mPressed = True
		  Me.Refresh
		End Sub
	#tag EndEvent
	#tag Event
		Sub PointerDrag(position As Point, pointerInfo() As PointerEvent)
		  If Not Self.Enabled Then Return

		  Dim isInside As Boolean = position.X >= 0.0 And position.Y >= 0.0 And position.X <= Me.Width And position.Y <= Me.Height
		  If mPressed <> isInside Then
		    mPressed = isInside
		    Me.Refresh
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub PointerUp(position As Point, pointerInfo() As PointerEvent)
		  If Not Self.Enabled Then Return

		  Dim shouldAction As Boolean = mPressed And position.X >= 0.0 And position.Y >= 0.0 And position.X <= Me.Width And position.Y <= Me.Height
		  mPressed = False
		  Me.Refresh

		  If shouldAction Then Self.Action
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="Label"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
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
		Name="Image"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Picture"
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
		Name="Width"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior

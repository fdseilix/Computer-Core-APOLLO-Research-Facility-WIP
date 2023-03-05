-- Transform Parameters
-- 0.35 Studs
--

-- Control
local TweenService = game:GetService("TweenService")
local ButtonTrigger = script.Parent.Parent.Parent.Button.ButtonTrigger
local Trigger = script.Parent.Parent.Parent.Trigger
--

-- Items
local Hinge = script.Parent.Parent.Parent.Hinge.Hinge
local Button = script.Parent.Parent.Parent.Button.Button
local ButtonPos1 = script.Parent.Parent.Parent.Button.Pos1
local ButtonPos2 = script.Parent.Parent.Parent.Button.Pos2
local ButtonPos3 = script.Parent.Parent.Parent.Button.Pos3
local MainFrame = script.Parent.Parent.Parent.MainFrame.MainFrame
local MainFramePos1 = script.Parent.Parent.Parent.MainFrame.Pos1
local MainFramePos2 = script.Parent.Parent.Parent.MainFrame.Pos2
--

-- Sounds
local ButtonSound = script.Parent.Parent.Parent.Button.Button.ButtonSound2
--

local CapUpAnimationSettings = TweenInfo.new(
	4,
	Enum.EasingStyle.Elastic,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)
local CapDownAnimationSettings = TweenInfo.new(
	1,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.In,
	0,
	false,
	0
)
local MainFrameAnimationSettings = TweenInfo.new(
	3,
	Enum.EasingStyle.Sine,
	Enum.EasingDirection.InOut,
	0,
	false,
	0
)
local ButtonAnimationSettings = TweenInfo.new(
	0.2,
	Enum.EasingStyle.Quint,
	Enum.EasingDirection.Out,
	0,
	false,
	0
)

local CapUp = {
	CFrame = Hinge.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local CapDown = {
	CFrame = Hinge.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local MainFrameUp = {
	CFrame = MainFramePos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local MainFrameDown = {
	CFrame = MainFramePos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ButtonUp1 = {
	CFrame = ButtonPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ButtonUp2 = {
	CFrame = ButtonPos3.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ButtonDown1 = {
	CFrame = ButtonPos2.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}
local ButtonDown2 = {
	CFrame = ButtonPos1.CFrame:ToWorldSpace(CFrame.new(0, 0, 0))
}

local CapUp = TweenService:Create(Hinge, CapUpAnimationSettings, {
	CFrame = Hinge.CFrame * CFrame.Angles(math.rad(-120), 0, 0)
})
local CapDown = TweenService:Create(Hinge, CapDownAnimationSettings, {
	CFrame = Hinge.CFrame * CFrame.Angles(math.rad(0), 0, 0)
})

local MainFrameUp = TweenService:Create(MainFrame, MainFrameAnimationSettings, MainFrameUp)
local MainFrameDown = TweenService:Create(MainFrame, MainFrameAnimationSettings, MainFrameDown)
local ButtonUp1 = TweenService:Create(Button, MainFrameAnimationSettings, ButtonUp1)
local ButtonUp2 = TweenService:Create(Button, ButtonAnimationSettings, ButtonUp2)
local ButtonDown1 = TweenService:Create(Button, ButtonAnimationSettings, ButtonDown1)
local ButtonDown2 = TweenService:Create(Button, MainFrameAnimationSettings, ButtonDown2)

ButtonTrigger.ClickDetector.MouseClick:Connect(function()
	ButtonTrigger.ClickDetector.MaxActivationDistance = 0
	ButtonSound:Play()
	ButtonDown1:Play()
	Button.Material = ("Metal")
	wait(0.5)
	MainFrameDown:Play()
	ButtonDown2:Play()
	wait(1.5)
	CapDown:Play()
end)

Trigger.ClickDetector.MouseClick:Connect(function()
	CapUp:Play()
	MainFrameUp:Play()
	ButtonUp1:Play()
	wait(3.5)
	ButtonUp2:Play()
	wait(0.5)
	Button.Material = ("Neon")
	ButtonTrigger.ClickDetector.MaxActivationDistance = 10
end)
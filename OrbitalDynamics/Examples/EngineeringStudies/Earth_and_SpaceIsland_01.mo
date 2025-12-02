within SpacecraftDynamics.OrbitalDynamics.Examples.EngineeringStudies;

model Earth_and_SpaceIsland_01
  extends Modelica.Icons.Example;
  //----------
  import units = Modelica.Units.SI;
  //----------
  parameter units.Time GlbPar_startTime = 10;
  parameter units.Time GlbPar_timeWidth = 1.77e-7;
  parameter units.Time GlbPar_periodRepeat = 10;
  parameter Integer GlbPar_nperiod = 260;
  parameter units.Pressure GlbPar_pulse_p_amp = 3.3e16;
  //----------
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity) annotation(
    Placement(transformation(origin = {-106, -70}, extent = {{-10, -10}, {10, 10}})));
  Components.GravitationalForce Fg_Earth_Island01(m_a_ref = Earth.m, m_b_ref = Island01.m) annotation(
    Placement(transformation(origin = {-34, -28.5}, extent = {{-18, -8.5}, {18, 8.5}})));
  AstronomicalObjects.Earth Earth annotation(
    Placement(transformation(origin = {-56, -70}, extent = {{-30, -30}, {30, 30}})));
  Modelica.Blocks.Sources.Constant signal_FX(k = 0) annotation(
    Placement(transformation(origin = {83, 14}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Blocks.Sources.Constant signal_FZ(k = 0) annotation(
    Placement(transformation(origin = {83, -21}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force1 annotation(
    Placement(transformation(origin = {52, 4}, extent = {{10, -10}, {-10, 10}})));
  SpacecraftDynamics.OrbitalDynamics.Components.GravitationalForce Fg_Earth_Moon(m_a_ref = Earth.m, m_b_ref = Moon.m) annotation(
    Placement(transformation(origin = {-68, 80.5}, extent = {{-18, -8.5}, {18, 8.5}})));
  SpacecraftDynamics.AstronomicalObjects.Moon Moon(r_0_Phase_xyplane_start = 60) annotation(
    Placement(transformation(origin = {-6, 80}, extent = {{-20, -20}, {20, 20}})));
  SpacecraftDynamics.OrbitalDynamics.Components.GravitationalForce Fg_Moon_Island01(m_a_ref = Moon.m, m_b_ref = Island01.m) annotation(
    Placement(transformation(origin = {-26, 29.5}, extent = {{-18, -8.5}, {18, 8.5}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Sensors.Distance d_Moon_Island01 annotation(
    Placement(transformation(origin = {-8, 43}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Sensors.Distance d_Earth_Island01 annotation(
    Placement(transformation(origin = {-16, -44}, extent = {{5, 5}, {-5, -5}}, rotation = 270)));
  Modelica.Blocks.Logical.LessEqualThreshold lessEqualThreshold(threshold = Earth.radius) annotation(
    Placement(transformation(origin = {18, -60}, extent = {{-4, -4}, {4, 4}})));
  Modelica.Blocks.Logical.TerminateSimulation terminateSimulation(condition = lessEqualThreshold.y == true) annotation(
    Placement(transformation(origin = {36, -74.6}, extent = {{-26, -2.6}, {26, 2.6}})));
  PropulsionSystem.Elements.BasicElements.PointPressureReceivingPlate00 plate(d2core_par = 55*9.725^(1/3))  annotation(
    Placement(transformation(origin = {129.6, 72}, extent = {{-11.4, -20}, {11.4, 20}})));
  Modelica.Blocks.Sources.Pulse pulse_p(amplitude = GlbPar_pulse_p_amp, nperiod = GlbPar_nperiod, period = GlbPar_periodRepeat, startTime = GlbPar_startTime, width = GlbPar_timeWidth) annotation(
    Placement(transformation(origin = {180, 72}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {74, 72}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Sensors.ForceSensor forceSensor annotation(
    Placement(transformation(origin = {101, 72}, extent = {{9, -9}, {-9, 9}})));
  Modelica.Blocks.Math.Gain gain_FY(k = -1) annotation(
    Placement(transformation(origin = {86, -4}, extent = {{4, -4}, {-4, 4}})));
  Components.Spacecraft00 Island01(m_par = 10000e9, r_0_abs_start = 362600*10^(3), v_0_abs_start = 1076) annotation(
    Placement(transformation(origin = {21, -14}, extent = {{-7, -13}, {7, 13}})));
  Modelica.Blocks.Continuous.Integrator impluse annotation(
    Placement(transformation(origin = {94, 39}, extent = {{7, -7}, {-7, 7}}, rotation = 90)));
equation
  connect(world.frame_b, Earth.frame_a) annotation(
    Line(points = {{-96, -70}, {-86, -70}}, color = {95, 95, 95}, thickness = 3));
  connect(Fg_Earth_Moon.frame_b, Moon.frame_a) annotation(
    Line(points = {{-50, 80.5}, {-44, 80.5}, {-44, 80}, {-26, 80}}, color = {95, 95, 95}, thickness = 3));
  connect(Fg_Earth_Moon.frame_a, Earth.frame_a) annotation(
    Line(points = {{-86, 80.5}, {-86, -70}}, color = {95, 95, 95}, thickness = 3));
  connect(Moon.frame_a, Fg_Moon_Island01.frame_a) annotation(
    Line(points = {{-26, 80}, {-26, 47.5}}, color = {95, 95, 95}, thickness = 3));
  connect(Moon.frame_a, d_Moon_Island01.frame_a) annotation(
    Line(points = {{-26, 80}, {-26, 54}, {-8, 54}, {-8, 48}}, color = {95, 95, 95}));
  connect(d_Earth_Island01.frame_a, Earth.frame_a) annotation(
    Line(points = {{-16, -49}, {-88, -49}, {-88, -70}, {-86, -70}}, color = {95, 95, 95}));
  connect(Fg_Earth_Island01.frame_a, Earth.frame_a) annotation(
    Line(points = {{-52, -28.5}, {-86, -28.5}, {-86, -70.5}}, color = {95, 95, 95}, thickness = 3));
  connect(d_Earth_Island01.distance, lessEqualThreshold.u) annotation(
    Line(points = {{-10.5, -44}, {-6.75, -44}, {-6.75, -60}, {13, -60}}, color = {0, 0, 127}));
  connect(signal_FX.y, force1.force[1]) annotation(
    Line(points = {{77.5, 14}, {70, 14}, {70, 4}, {64, 4}}, color = {0, 0, 127}));
  connect(signal_FZ.y, force1.force[3]) annotation(
    Line(points = {{77.5, -21}, {70, -21}, {70, 4}, {64, 4}}, color = {0, 0, 127}));
  connect(fixed.flange, forceSensor.flange_b) annotation(
    Line(points = {{74, 72}, {92, 72}}, color = {0, 127, 0}));
  connect(forceSensor.flange_a, plate.flange) annotation(
    Line(points = {{110, 72}, {118, 72}}, color = {0, 127, 0}));
  connect(gain_FY.y, force1.force[2]) annotation(
    Line(points = {{81.6, -4}, {70.6, -4}, {70.6, 4}, {64, 4}}, color = {0, 0, 127}));
  connect(gain_FY.u, forceSensor.f) annotation(
    Line(points = {{91, -4}, {108, -4}, {108, 62}}, color = {0, 0, 127}));
  connect(Island01.frame_a, Fg_Earth_Island01.frame_b) annotation(
    Line(points = {{14, -13}, {-16, -13}, {-16, -28.5}}, color = {95, 95, 95}, thickness = 3));
  connect(Island01.frame_a, force1.frame_b) annotation(
    Line(points = {{14, -13}, {14, 4}, {42, 4}}, color = {95, 95, 95}, thickness = 3));
  connect(Island01.frame_a, Fg_Moon_Island01.frame_b) annotation(
    Line(points = {{14, -13}, {-26, -13}, {-26, 11.5}}, color = {95, 95, 95}, thickness = 3));
  connect(Island01.frame_a, d_Moon_Island01.frame_b) annotation(
    Line(points = {{14, -13}, {-8, -13}, {-8, 38}}, color = {95, 95, 95}));
  connect(d_Earth_Island01.frame_b, Fg_Earth_Island01.frame_b) annotation(
    Line(points = {{-16, -39}, {-16, -28.5}}, color = {95, 95, 95}));
  connect(pulse_p.y, plate.u_p) annotation(
    Line(points = {{169, 72}, {139, 72}}, color = {0, 0, 127}));
  connect(forceSensor.f, impluse.u) annotation(
    Line(points = {{108.2, 62.1}, {108.2, 56.1}, {94.2, 56.1}, {94.2, 48.1}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 800000, Tolerance = 1e-09, Interval = 100),
    Diagram(coordinateSystem(extent = {{-140, -140}, {220, 140}}), graphics = {Rectangle(origin = {136, 73}, pattern = LinePattern.Dash, extent = {{-76, 45}, {76, -45}}), Text(origin = {169, 36}, extent = {{-37, 6}, {37, -6}}, textString = "nuclear pulse engine"), Text(origin = {61, -86}, extent = {{-49, 6}, {49, -6}}, textString = "terminate simulation 
when Island01 hits the ground.", horizontalAlignment = TextAlignment.Left), Rectangle(origin = {60, -73}, pattern = LinePattern.Dash, extent = {{-54, 25}, {54, -25}})}),
    Icon(coordinateSystem(extent = {{-120, -140}, {220, 140}})));
end Earth_and_SpaceIsland_01;
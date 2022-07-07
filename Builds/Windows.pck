GDPC                                                                               <   res://.import/blob.png-768f90603671680ed858621e2174775f.stex�h      �       ��xg��w� <��t8h <   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex�l      �      &�y���ڞu;>��.p   res://Entities/Hider.tscn         �      �4���EY�L�n(��   res://Entities/NPC.tscn 	      �      ��tօz���@�iRA}   res://Entities/Seeker.tscn  �
      �       �NNo-d$i��`�w���   res://Scenes/Map1.tscn  �      ^      �p0�N�y�*�F*��G    res://Scenes/NetworkSetup.tscn         �      S�S��;4�`�b�    res://Scenes/WinScreen.gd.remap `u      +       �X�K�""��-�)�SI   res://Scenes/WinScreen.gdc  !      $      �F����!tyxE�_+�   res://Scripts/Hider.gd.remap�u      (       �H��'t8l���<>�   res://Scripts/Hider.gdc @"      q
      P�A���%X����7�$   res://Scripts/NPC.gd.remap  �u      &       .�JE�m�qЃ��;c   res://Scripts/NPC.gdc   �,      �
      ����= A�7����b    res://Scripts/NameTag.gd.remap  �u      *       �E�=o��.xG�)�   res://Scripts/NameTag.gdc   �7      I       3��ޏ��9tA���[�O    res://Scripts/Network.gd.remap   v      *       �iH����& ��x��   res://Scripts/Network.gdc   �7      �      ���)P��zt�!� �$   res://Scripts/NetworkSetup.gd.remap Pv      /       L+�K3�J�-k}�~    res://Scripts/NetworkSetup.gdc  �;      �%      tN ���p�����*�    res://Scripts/Seeker.gd.remap   �v      )       ��K[�^�y�C��1�O   res://Scripts/Seeker.gdc�a      (      �V� )u���æa�   res://blob.png.import   pi      �      ZSv����Ɓz��+�   res://default_env.tres   l      �       um�`�N��<*ỳ�8   res://icon.png  �v      �      G1?��z�c��vN��   res://icon.png.import   �r      �      ��fe��6�B��^ U�   res://project.binary��      b      Cx��k:���e����?�            [gd_scene load_steps=4 format=2]

[ext_resource path="res://blob.png" type="Texture" id=1]
[ext_resource path="res://Scripts/Hider.gd" type="Script" id=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 8, 8 )

[node name="Hider" type="KinematicBody2D"]
script = ExtResource( 2 )

[node name="Blob" type="Sprite" parent="."]
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )

[node name="Camera2D" type="Camera2D" parent="."]
 [gd_scene load_steps=4 format=2]

[ext_resource path="res://blob.png" type="Texture" id=1]
[ext_resource path="res://Scripts/NPC.gd" type="Script" id=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 8, 8 )

[node name="NPC" type="KinematicBody2D"]
script = ExtResource( 2 )

[node name="Blob" type="Sprite" parent="."]
texture = ExtResource( 1 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
shape = SubResource( 1 )
        [gd_scene load_steps=2 format=2]

[ext_resource path="res://Scripts/Seeker.gd" type="Script" id=1]

[node name="Seeker" type="Node2D"]
script = ExtResource( 1 )

[node name="Camera2D" type="Camera2D" parent="."]
            [gd_scene load_steps=8 format=2]

[sub_resource type="RectangleShape2D" id=1]
extents = Vector2( 860, 138 )

[sub_resource type="QuadMesh" id=2]

[sub_resource type="Gradient" id=3]
colors = PoolColorArray( 0.698039, 0.615686, 0.505882, 1, 0.698039, 0.615686, 0.505882, 1 )

[sub_resource type="GradientTexture" id=4]
gradient = SubResource( 3 )

[sub_resource type="RectangleShape2D" id=5]
extents = Vector2( 15, 543 )

[sub_resource type="QuadMesh" id=6]

[sub_resource type="GradientTexture" id=7]
gradient = SubResource( 3 )

[node name="Map1" type="Node2D"]

[node name="Floor" type="StaticBody2D" parent="."]
position = Vector2( 0, 900 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="Floor"]
shape = SubResource( 1 )

[node name="MeshInstance2D" type="MeshInstance2D" parent="Floor"]
position = Vector2( 0, 241.5 )
scale = Vector2( 3498, 759 )
mesh = SubResource( 2 )
texture = SubResource( 4 )

[node name="WallR" type="StaticBody2D" parent="."]
position = Vector2( 863, 495 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="WallR"]
shape = SubResource( 5 )

[node name="MeshInstance2D" type="MeshInstance2D" parent="WallR"]
position = Vector2( 438, 0 )
scale = Vector2( 906, 1086 )
mesh = SubResource( 6 )
texture = SubResource( 7 )

[node name="WallL" type="StaticBody2D" parent="."]
position = Vector2( -863, 495 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="WallL"]
shape = SubResource( 5 )

[node name="MeshInstance2D" type="MeshInstance2D" parent="WallL"]
position = Vector2( -438, 0 )
scale = Vector2( 906, 1086 )
mesh = SubResource( 6 )
texture = SubResource( 7 )
  [gd_scene load_steps=6 format=2]

[ext_resource path="res://Scripts/NetworkSetup.gd" type="Script" id=1]
[ext_resource path="res://Scenes/WinScreen.gd" type="Script" id=2]

[sub_resource type="StyleBoxFlat" id=1]
bg_color = Color( 0.835294, 0.294118, 0.294118, 1 )

[sub_resource type="StyleBoxFlat" id=2]
bg_color = Color( 0.356863, 0.113725, 0.113725, 1 )

[sub_resource type="StyleBoxFlat" id=3]
bg_color = Color( 0.478431, 0.164706, 0.164706, 1 )

[node name="NetworkSetup" type="Control"]
anchor_right = 1.0
anchor_bottom = 1.0
script = ExtResource( 1 )

[node name="MultiplayerConfig" type="Control" parent="."]
anchor_right = 1.0
anchor_bottom = 1.0

[node name="VBoxContainer" type="VBoxContainer" parent="MultiplayerConfig"]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -217.0
margin_top = -130.0
margin_right = 217.0
margin_bottom = 120.0
custom_constants/separation = 50

[node name="CreateServer" type="Button" parent="MultiplayerConfig/VBoxContainer"]
margin_right = 434.0
margin_bottom = 100.0
rect_min_size = Vector2( 0, 100 )
text = "Create Server"

[node name="JoinServer" type="Button" parent="MultiplayerConfig/VBoxContainer"]
margin_top = 150.0
margin_right = 434.0
margin_bottom = 250.0
rect_min_size = Vector2( 0, 100 )
text = "Join Server"

[node name="ServerIpAddress" type="LineEdit" parent="MultiplayerConfig"]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -115.0
margin_top = -274.0
margin_right = 115.0
margin_bottom = -214.0
text = "Enter IP Address:"
align = 1

[node name="Lobby" type="Control" parent="."]
visible = false
margin_right = 1920.0
margin_bottom = 1080.0

[node name="Label" type="Label" parent="Lobby"]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -371.0
margin_top = -344.0
margin_right = -241.0
margin_bottom = -306.0
text = "Player List"
align = 1
valign = 1

[node name="ItemList" type="ItemList" parent="Lobby"]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -520.0
margin_top = -280.0
margin_right = -89.0
margin_bottom = 280.0

[node name="Button" type="Button" parent="Lobby"]
visible = false
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = 94.0
margin_top = -54.0
margin_right = 372.0
margin_bottom = 54.0
text = "Start Game"

[node name="Timer" type="Timer" parent="."]
wait_time = 10.0
one_shot = true

[node name="CanvasLayer" type="CanvasLayer" parent="."]

[node name="Label" type="Label" parent="CanvasLayer"]
visible = false
anchor_left = 0.5
anchor_right = 0.5
margin_left = -42.0
margin_top = 59.0
margin_right = -11.0
margin_bottom = 76.0
rect_scale = Vector2( 3, 3 )
text = "4:00"

[node name="WinScreen" type="Control" parent="."]
visible = false
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -960.0
margin_top = -540.0
margin_right = 960.0
margin_bottom = 540.0
script = ExtResource( 2 )

[node name="Panel" type="Panel" parent="WinScreen"]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -672.0
margin_top = -373.0
margin_right = 672.0
margin_bottom = 373.0

[node name="Label" type="Label" parent="WinScreen/Panel"]
anchor_left = 0.5
anchor_top = 0.5
anchor_right = 0.5
anchor_bottom = 0.5
margin_left = -97.5
margin_top = -37.5
margin_right = 97.5
margin_bottom = 37.5
text = "_______ WIN!"
align = 1
valign = 1

[node name="Button" type="Button" parent="WinScreen/Panel"]
anchor_left = 1.0
anchor_right = 1.0
margin_left = -40.0
margin_top = 10.0
margin_right = -11.0
margin_bottom = 34.0
custom_styles/hover = SubResource( 1 )
custom_styles/pressed = SubResource( 2 )
custom_styles/focus = SubResource( 3 )
custom_styles/normal = SubResource( 1 )
text = "X"
   GDSC         	   %      ������ڶ   �����϶�   ����ڶ��   �����ض�   ������¶   �������������Ҷ�   ���Ӷ���      pressed       _close_pressed                           
                        #   	   3YYY0�  PQV�  W�  �  T�  PRR�  QYY0�  PQV�  �  PQY`            GDSC   )      J   �     ������������τ�   �����ζ�   ������϶   ���ζ���   ���϶���   ����ڶ��   �������Ҷ���   �����������ڶ���   ��������������Ҷ   ����������ڶ   �������������Ҷ�   �������ض���   �������Ҷ���   ���������¶�   ��������¶��   ����϶��   ����������Ӷ   �������Ӷ���   ���¶���   �������Ӷ���   �����϶�   ���Ӷ���   ��������������������Ҷ��   �����ׄ򶶶�   ������¶   �������Ŷ���   ����׶��   ����¶��   ������������������޶   �������Ķ���   ��������Ŷ��   ����������������Ҷ��   ���ƶ���   ����������������Ķ��   �������Ŷ���   ��������������ض   ����������������Ҷ��   ϶��   ��������   �������������Ӷ�   ���������������Ӷ���         333333�?      ?        �������?              �������?                d             NetworkSetup            right         left      KinematicBody2D       Floor         up        sprint        1         position      velx      vely      playertoserver     '    333333�?                                                 !   	   &   
   +      0      5      :      ?      D      I      N      ]      ^      d      s      z      {      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (      )     *     +     ,     -     .     /   #  0   '  1   +  2   .  3   2  4   6  5   7  6   A  7   M  8   Y  9   e  :   h  ;   r  <   w  =   |  >   �  ?   �  @   �  A   �  B   �  C   �  D   �  E   �  F   �  G   �  H   �  I   �  J   3YY;�  Y;�  �  Y;�  Y;�  Y;�  �  Y;�  �  Y;�  �  Y;�  �  Y;�	  �  Y;�
  �  Y;�  �  Y;�  �  Y;�  �	  Y;�  �
  Y;�  �  Y5;�  �  PQT�  T�  P�  QYY0�  PQV�  &�  �>  P�  PQT�  PQQV�  W�  T�  �  YY0�  P�  QV�  &�  �>  P�  PQT�  PQQV�  �  �  T�  P�  Q�  T�  P�  Q�  �  &�  V�  �  �  �  �  �  �  &�  P�  Q�  V�  �  �  �  P�  Q�  '�  V�  �  �  �  �  �  �  �  �  �  �  �  �  &�  �  V�  &�  T�  T�  PQ�  �  T�  T�  �  V�  �  �  �  �  �  �  (V�  �  �  �  �  &�  T�  P�  Q�  �  V�  �   PQ�  �  &�  T�  P�  QV�  �  �	  �  �  �
  �  (V�  �  �  �  �  �  �  �  &�  PQT�!  PQV�  �  T�"  L�  ML�  M�#  �  �  T�"  L�  ML�  M�  �  �  T�"  L�  ML�  M�  �  (V�  �  T�$  P�  R�  RN�  �  V�#  R�  �  V�  R�  �  V�  R�  OQ�  �  &�#  T�%  �  V�  �#  �  T�&  �  �  �'  P�  P�  �  RQQ�  �  �(  P�  PR�  �  �  QQYY0�   PQV�  �  �  �  �  �  Y`               GDSC   (      V   �     ������������τ�   ���Ķ���   ��������Ķ��   ������϶   ���ζ���   ���϶���   ����ڶ��   �������Ҷ���   �������ض���   �������Ҷ���   ���������¶�   ��������¶��   ����Ķ��   �����������������¶�   ������������Ӷ��   ���������Ӷ�   ��������������Ŷ   �������ض���   ����϶��   ����������Ӷ   �������Ӷ���   ���¶���   �������Ӷ���   �����϶�   �����������ض���   �������Ŷ���   ����׶��   ����������������Ķ��   �������Ķ���   ���Ӷ���   ��������Ŷ��   ���ƶ���   ��������������ض   ϶��   ��������   �������Ŷ���   ��Ŷ   �������������Ӷ�   ���������������Ӷ���   ���Ӷ���             stand     333333�?      ?        �������?                d               walk      jump          NetworkSetup      Floor               KinematicBody2D   �������?   '        position      velx      vely        333333�?                                                 !   	   &   
   +      0      5      :      ?      D      I      N      Y      \      a      p      q      w      {      |      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   �   '   �   (   �   )   �   *   �   +   �   ,   �   -   �   .   �   /     0     1   	  2   
  3     4     5     6   !  7   '  8   (  9   3  :   ?  ;   K  <   W  =   X  >   d  ?   t  @   u  A   {  B     C   �  D   �  E   �  F   �  G   �  H   �  I   �  J   �  K   �  L   �  M   �  N   �  O   �  P   �  Q   �  R   �  S   �  T   �  U   �  V   3YY;�  Y;�  �  Y;�  �  Y;�  Y;�  Y;�  �  Y;�  �  Y;�  �  Y;�	  �  Y;�
  �  Y;�  �  Y;�  Y;�  Y;�  �	  Y;�  �	  Y;�  L�
  R�  R�  MY;�  Y;�  �  Y5;�  �  PQT�  T�  P�  QYY0�  PQV�  �  PQYY0�  P�  QV�  &�  PQT�  PQV�  �  �  �  �  &�  �  �  V�  �  PQ�  �  &�  V�  �  �  �  �  �  �  &�  P�  Q�  V�  �  �  �  P�  Q�  (V�  �  �  �  �  �  �  �  �  �  �  �  �  �  &�  �  V�  &�  T�  T�  �  V�  �	  �  �  �  �  &�  T�  T�  PQ�  V�  �  �  �  (V�  �	  �  �  �  &�  �  �	  �  V�  �  PQ�  �  &�   T�!  �  V�  �   �  T�"  �  �  &�  T�#  T�$  P�  QV�  �  T�#  L�  ML�  M�   �  �  T�#  L�  ML�  M�  �  �  T�#  L�  ML�  M�  �  �  �%  P�  P�  �  RQQ�  �  �&  P�  PR�  �  �  QQYY0�  PQV�  �%  PQ�  �  �(  PR�  Q�  �%  PQ�  �  �  L�(  PR�  T�'  PQQM�  �  &�  �  V�  �%  PQ�  �  �  P�(  P�  R�  QQ�  &�  �  V�  �  �  �  &�  �  V�  �  �  �  (V�  �  �  �  �  �  YY0�  PQV�  �  �
  �  �  �  Y`         GDSC                   ������������ڶ��                   3YY`       GDSC            �      ���ӄ�   ���Ķ���   �����������������������¶���   ����   ���Ӷ���   ������Ŷ   ���¶���   ���������Ŷ�   �����϶�   �������Ӷ���   ������¶   ������������Ķ��   �����������Ķ���   ����������Ķ   �ƶ�   ������������¶��   ���������������Ҷ���   ������������������Ҷ      seeker     8              connected_to_server       server_connected      server_disconnected       server connected      server disconnected                                            !      "   	   #   
   )      6      C      D      J      S      [      \      ]      d      m      u      v      |      �      �      �      �      3YY;�  �  T�  PQY;�  Y;�  LMY;�  �  Y;�  �  YYY0�  PQV�  �	  PQT�
  P�  RR�  Q�  �	  PQT�
  P�  RR�  QYY0�  PQV�  �  T�  P�  R�  Q�  �	  PQT�  �  �  YY0�  P�  QV�  �  T�  P�  R�  Q�  �	  PQT�  �  YY0�  PQV�  �?  P�  QYY0�  PQV�  �?  P�  QY`               GDSC   g   @     �     ������ڶ   ������������������߶   ����������������Ѷ��   ���������������ζ���   ��������������Ŷ   ������߶   ����϶��   ��ƶ   ��ն   ����Ķ��   �����Ķ�   ��������¶��   �����������¶���   ���������������Ŷ���   �������Ŷ���   ����������Ҷ   �����϶�   �������Ӷ���   ������¶   ������������Ķ��   �����������Ķ���   ���������Ķ�   �����ض�   ����Ķ��   �������Ŷ���   ����׶��   �������������Ŷ�   ����������������Ķ��   �������������Ӷ�   ������Ķ   ��������¶��   ����������Ķ   ����ڶ��   ���¶���   ��ն   ����������������Ҷ��   �Ҷ�   ��Ŷ   �����Ҷ�   �������Ӷ���   �������۶���   �����Ҷ�   �������������������Ҷ���   ����Ӷ��   ����Ŷ��   ���Ӷ���   ��������������Ҷ   ���¶���   �������Ӷ���   �����������Ҷ���   �����������������������Ҷ���   ������ݶ   ������������Ķ��   ���Ӷ���   ��������   ߶��   ���������������������Ҷ�   ����������Ķ   ��������������������Ҷ��   ���Ӷ���   ��������������Ӷ   �������������������Ķ���   �����������������Ҷ�   �������������������Ҷ���   �������Ӷ���   �������������Ķ�   ����������Ŷ   ��϶   ����������������Ҷ��   �������������Ķ�   Ӷ��   ��������Ӷ��   ��������Ҷ��   �������Ӷ���   ���Ŷ���   ���Ҷ���   ��������������ض   �������ض���   ���ζ���   ���϶���   ��������������������Ҷ��   ���¶���   ���Ӷ���   ����ζ��   ����϶��   �����۶�   ���������ݶ�   ����¶��   ���������Ӷ�   ��������Ķ��   ��������Ҷ��   ��������Ŷ��   ��Ŷ   �����������ض���   ����������ٶ   ��¶   ������������Ķ��   ��������Ķ��   ���������ض�   ��������¶��   ��������ض��   ��������ض��   ����ڶ��      res://Scenes/Map1.tscn        res://Entities/NPC.tscn       res://Entities/Hider.tscn         res://Entities/Seeker.tscn     d                             network_peer_connected        _player_connected         network_peer_disconnected         _player_disconnected      connected_to_server       _connected_to_server      connection_failed         _connection_failed        server_disconnected       _server_disconnected      pressed       _on_createserver_pressed      _on_joinserver_pressed        _on_startgame_pressed         timeout    	   _timerout         servertoplayer     <         :      	   synctimer         Player     
    connected        ItemList   	   newplayer      	   startgame         type      seeker        position      velx      vely       disconnected         hider         Map1/         Map1      Button            !   not enough players to start game!         connected to server!      connection failed :(      server disconnected    &   servertoplayer executing on server lol              NPC    �     �        creating npc          creating hider        creating seeker    
             hidertoseeker      
   lol u suck     
   seekerswin     	   hiderswin      
   HIDERS WIN        SEEKERS WIN                    
                  #      ,      5   	   >   
   ?      D      I      P      Q      R      S      Y      Z      _      `      a      g      t      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %      &   "  '   +  (   2  )   3  *   :  +   F  ,   G  -   Q  .   X  /   g  0   h  1   i  2   s  3   |  4   }  5   ~  6   �  7   �  8   �  9   �  :   �  ;   �  <   �  =   �  >   �  ?   �  @   �  A   �  B   �  C   �  D   �  E   �  F   �  G   �  H     I   	  J   
  K     L   #  M   F  N   G  O   M  P   S  Q   Y  R   _  S   j  T   k  U   q  V   �  W   �  X   �  Y   �  Z   �  [   �  \   �  ]   �  ^   �  _   �  `   �  a   �  b   �  c   �  d   �  e   �  f   �  g   �  h   �  i   �  j   �  k   �  l   �  m   �  n   �  o   �  p   �  q   �  r     s     t     u   +  v   8  w   9  x   :  y   B  z   M  {   Q  |   T  }   Y  ~   Z     a  �   p  �   v  �   |  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �     �     �   +  �   A  �   W  �   m  �   n  �   o  �   r  �   s  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �     �     �   	  �     �     �   #  �   3  �   =  �   >  �   D  �   E  �   T  �   U  �   V  �   \  �   e  �   f  �   g  �   k  �   ~  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �     �     �     �   '  �   (  �   ,  �   1  �   8  �   9  �   @  �   E  �   K  �   T  �   X  �   g  �   h  �   p  �   t  �   y  �     �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �   �  �     �     �   	  �   
  �     �     �     �   /  �   0  �   8  �   A  �   B  �   H  �   N  �   R  �   W  �   X     ^    h    l    q    r    y    }    �    �  	  �  
  �    �    �    �    3YY5;�  W�  Y5;�  W�  �  Y5;�  W�  Y5;�  �L  PQY5;�  �L  P�  QY5;�	  �L  P�  QY5;�
  �L  P�  QYY;�  �  Y;�  �  Y;�  L�  MYYYY;�  NOYY;�  �  YYY0�  PQV�  �  PQT�  P�  RR�	  Q�  �  PQT�  P�
  RR�  Q�  �  PQT�  P�  RR�  Q�  �  PQT�  P�  RR�  Q�  �  PQT�  P�  RR�  Q�  W�  �  �  T�  P�  RR�  Q�  W�  �  �  T�  P�  RR�  Q�  W�  �  T�  P�  RR�  Q�  W�  T�  P�  RR�  QYY0�  P�  QV�  �  PQ�  �  &�  PQT�  PQV�  �  P�  R�  Q�  ;�  �>  P�  PW�  T�  �  QQ�  �>  P�  P�  PW�  T�  R�  QQQ�  W�  �   T�!  �  �  �"  P�  R�  QYY0�#  P�$  QV�  �?  P�  �>  P�$  Q�  Q�  �  &�  T�%  P�$  QV�  �  T�&  P�$  Q�  �  T�'  P�  QT�(  P�>  P�$  QQ�  �  �  &�  PQT�  PQV�  �)  P�$  R�  R�  Q�  �  �  &�  �  PQT�  PQV�  �)  P�$  R�   Q�  �  L�>  P�$  QMN�  �!  V�"  R�  �#  V�  P�  R�  QR�  �$  V�  R�  �%  V�  �  OYY0�*  P�$  QV�  �?  P�  �>  P�$  Q�&  Q�  �  T�+  P�$  Q�  �  T�'  P�  QT�,  T�+  P�$  Q�  �  �  &�  T�%  P�$  QV�  &�  L�>  P�$  QMT�-  �'  V�  �  �  �  &�  PQT�  PQV�  �.  PQ�  �  �  T�+  P�$  Q�  &�  PQT�/  T�0  P�(  �>  P�$  QQV�  �  PQT�/  T�'  P�)  QT�1  P�  PQT�/  T�'  P�)  QT�'  P�(  �>  P�$  QQQYY0�2  PQV�  �3  T�4  PQ�  �  T�5  PQ�  �  T�6  PQ�  �  T�'  P�*  QT�6  PQ�  �  )�7  �  V�  �  T�'  P�  QT�(  P�>  P�7  QQYY0�8  PQV�  &�  T�!  �+  V�  �3  T�9  P�  T�!  QYY0�:  PQV�  &�  T�;  PQ�  V�  �<  PQ�  (V�  �<  PQ�  �?  P�,  QYY0�=  PQV�  �  T�5  PQ�  �  T�6  PQ�  �  �?  P�-  QYY0�>  PQV�  �?  P�.  QYY0�?  PQV�  �@  PQ�  �  T�5  PQ�  �  T�6  PQ�  �?  P�/  QYYD0�A  P�B  QV�  ;�C  �>  P�  PQT�D  PQQ�  �  L�C  ML�#  M�B  L�#  M�  �  L�C  ML�$  M�B  L�$  M�  �  L�C  ML�%  M�B  L�%  MYYYD0�E  P�F  QV�  &�  PQT�  PQV�  �  �F  �  (V�  �?  P�0  QYYD0�G  PQV�  �  PQT�/  T�H  P�  T�I  PQQ�  �  T�5  PQ�  �  T�5  PQ�  W�  �   T�6  PQ�  �  �1  YY0�  PQV�  &�  V�  )�7  �  T�J  PQV�  �  �  &�  PQT�/  T�'  P�)  QT�0  P�7  QV�  �  �  &�>  P�7  QT�K  P�2  Q�  �  PQT�  PQV�  �  PQT�/  T�'  P�(  �7  QT�L  �  L�7  MT�M  �  �  PQT�/  T�'  P�(  �7  QT�N  �  L�7  MT�N  �  �  PQT�/  T�'  P�(  �7  QT�O  �  L�7  MT�O  �  �  &�7  �>  P�  PQT�P  PQQ�>  P�7  QT�K  P�2  Q�  V�  �  PQT�/  T�'  P�(  �7  QT�L  �  L�7  MT�M  �  �  PQT�/  T�'  P�(  �7  QT�N  �  L�7  MT�N  �  �  PQT�/  T�'  P�(  �7  QT�O  �  L�7  MT�O  �  �  �  (V�  �  &�>  P�7  QT�K  P�2  Q�  V�  ;�Q  �  T�I  PQ�  �Q  T�R  �7  �  �%  PQ�  ;�S  �(  P�3  R�3  Q�  �%  PQ�  ;�T  �(  P�3  R�4  Q�  �Q  T�L  �  P�S  R�T  Q�  �  PQT�/  T�'  P�)  QT�H  P�Q  Q�  �?  P�5  �7  Q�  �  �  '�  L�7  MT�-  �'  V�  ;�Q  �	  T�I  PQ�  �Q  T�R  �7  �  �  PQT�/  T�'  P�)  QT�H  P�Q  Q�  �?  P�6  �>  P�7  QQ�  �  �  '�  L�7  MT�-  �"  V�  ;�Q  �
  T�I  PQ�  �Q  T�R  �7  �  �  PQT�/  T�'  P�)  QT�H  P�Q  Q�  �?  P�7  �>  P�7  QQYY0�<  PQV�  �  �  PQT�/  T�H  P�  T�I  PQQ�  �  �  �  T�5  PQ�  W�  �   T�6  PQ�  �  �  �%  PQ�  ;�U  �  P�(  P�  R�  T�;  PQ�  QQ�  ;�V  �>  P�  L�U  MQ�  �  �  �  T�;  PQ�  �  �  �  )�7  �  V�  ;�C  �>  P�7  Q�  �  L�C  MNO�  �  L�C  ML�#  M�  P�  R�  Q�  �  L�C  ML�$  M�  �  �  L�C  ML�%  M�  �  &�C  �V  V�  �  L�C  MT�-  �"  �  (V�  �  L�C  MT�-  �'  �  �  �  )�7  �  V�  ;�C  �2  �>  P�7  Q�  �  L�C  MNO�  �  L�C  ML�#  M�  P�  R�  Q�  �  L�C  ML�$  M�  �  �  L�C  ML�%  M�  �  �  �  �1  �  �"  P�   Q�  W�  T�W  PQYYD0�@  PQV�  �  NO�  �  T�6  PQ�  W�  �   T�5  PQ�  �  �  �  �  PQT�/  T�'  P�)  QT�X  PQYYD0�Y  P�Z  QV�  �  �Z  �  �?  P�  Q�  )�7  �  V�  �  T�'  P�  QT�(  P�>  P�7  QQYYD0�[  P�\  QV�  )�7  �  PQT�/  T�'  P�)  QT�]  PQV�  &�\  T�^  P�7  T�L  Q	�8  V�  �  &�>  P�7  T�R  QT�K  P�2  Q�  �7  T�_  P�"  Q�9  V�  �  L�7  T�R  MT�-  �"  �  �"  P�:  R�7  T�R  Q�  �  PQT�/  T�'  P�)  QT�1  P�  PQT�/  T�'  P�(  �7  T�R  QQ�  �  �?  P�;  Q�  YYD0�`  P�$  QV�  �  �  PQT�/  T�'  P�)  QT�1  P�  PQT�/  T�'  P�(  �$  QQYYD0�a  P�  QV�  W�  �   T�!  �  YY0�.  PQV�  &�  	�  V�  �b  PQ�  �"  P�<  QYY0�c  PQV�  &�  PQT�  PQV�  �d  PQ�  �"  P�=  QYYD0�d  PQV�  �@  PQ�  W�e  �f  �   T�!  �>  �  W�e  T�6  PQYYD0�b  PQV�  �@  PQ�  W�e  �f  �   T�!  �?  �  W�e  T�6  PQY` GDSC   "      .   =     ���ӄ�   ��������¶��   �������϶���   ��������   ����ڶ��   �������Ҷ���   �������ض���   �����ζ�   �����϶�   ��������۶��   �������ն���   �����Ķ�   ����������Ӷ   �������Ӷ���   ���¶���   �������Ӷ���   ���ζ���   ���϶���   �����϶�   ���Ӷ���   ��������������������Ҷ��   �����ׄ򶶶�   ������¶   �������Ŷ���   ����׶��   ����¶��   ������������������޶   �����޶�   �������ض���   ���������������������Ҷ�   ����������������Ķ��   ��������Ŷ��   ������������������������ض��   �����Ҷ�   d         ?        �������?                   NetworkSetup      right         left      down      up              target           	   makeguess                                                    #   	   (   
   -      4      9      H      I      J      O      T      U      [      j      q      r      y      �      �      �      �      �      �      �      �       �   !   �   "   �   #   �   $   �   %     &     '     (     )     *   "  +   +  ,   .  -   ;  .   3YY;�  Y;�  �  T�  Y;�  �  Y;�  �  Y;�  �  Y;�  �  Y;�  �  Y;�	  �  Y;�
  �  T�  Y;�  �  Y5;�  �  PQT�  T�  P�  QYYY;�  �  Y;�  �  YY0�  PQV�  &�  �>  P�  PQT�  PQQV�  W�  T�  �  YY0�  P�  QV�  &�  �>  P�  PQT�  PQQV�  �  �  T�  P�  Q�  T�  P�  Q�  �  �  T�  P�	  Q�  T�  P�
  Q�  �  &�  �  �  �  V�  �	  �
  P�  P�  R�  Q�  P�  R�  QQ�  �
  �  P�  �	  R�  �	  Q�  �  �
  �  �  �  �  (V�  �
  �  T�  �  �  �  �  �  �  �  �  &�  T�  PQ�  V�  �  �  �  T�  PQ�  �  �  �  �  �  �  �  &�  T�  P�  QV�  &�  PQT�  PQV�  �  T�  P�   PQQ�  (V�  �  T�!  P�  R�  R�   PQQY`        GDST                �   WEBPRIFFx   WEBPVP8Lk   /�7@@F�,7є�ڶ�ʡ�k6��X��&w� ���?Zd�R���7PIRs� �<  �Ͽ����O�H~��{�Aw�+C�ݏ�>M]�<�] [remap]

importer="texture"
type="StreamTexture"
path="res://.import/blob.png-768f90603671680ed858621e2174775f.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://blob.png"
dest_files=[ "res://.import/blob.png-768f90603671680ed858621e2174775f.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
             [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST@   @            �  WEBPRIFF�  WEBPVP8L�  /?����m��������_"�0@��^�"�v��s�}� �W��<f��Yn#I������wO���M`ҋ���N��m:�
��{-�4b7DԧQ��A �B�P��*B��v��
Q�-����^R�D���!(����T�B�*�*���%E["��M�\͆B�@�U$R�l)���{�B���@%P����g*Ųs�TP��a��dD
�6�9�UR�s����1ʲ�X�!�Ha�ߛ�$��N����i�a΁}c Rm��1��Q�c���fdB�5������J˚>>���s1��}����>����Y��?�TEDױ���s���\�T���4D����]ׯ�(aD��Ѓ!�a'\�G(��$+c$�|'�>����/B��c�v��_oH���9(l�fH������8��vV�m�^�|�m۶m�����q���k2�='���:_>��������á����-wӷU�x�˹�fa���������ӭ�M���SƷ7������|��v��v���m�d���ŝ,��L��Y��ݛ�X�\֣� ���{�#3���
�6������t`�
��t�4O��ǎ%����u[B�����O̲H��o߾��$���f���� �H��\��� �kߡ}�~$�f���N\�[�=�'��Nr:a���si����(9Lΰ���=����q-��W��LL%ɩ	��V����R)�=jM����d`�ԙHT�c���'ʦI��DD�R��C׶�&����|t Sw�|WV&�^��bt5WW,v�Ş�qf���+���Jf�t�s�-BG�t�"&�Ɗ����׵�Ջ�KL�2)gD� ���� NEƋ�R;k?.{L�$�y���{'��`��ٟ��i��{z�5��i������c���Z^�
h�+U�mC��b��J��uE�c�����h��}{�����i�'�9r�����ߨ򅿿��hR�Mt�Rb���C�DI��iZ�6i"�DN�3���J�zڷ#oL����Q �W��D@!'��;�� D*�K�J�%"�0�����pZԉO�A��b%�l�#��$A�W�A�*^i�$�%a��rvU5A�ɺ�'a<��&�DQ��r6ƈZC_B)�N�N(�����(z��y�&H�ض^��1Z4*,RQjԫ׶c����yq��4���?�R�����0�6f2Il9j��ZK�4���է�0؍è�ӈ�Uq�3�=[vQ�d$���±eϘA�����R�^��=%:�G�v��)�ǖ/��RcO���z .�ߺ��S&Q����o,X�`�����|��s�<3Z��lns'���vw���Y��>V����G�nuk:��5�U.�v��|����W���Z���4�@U3U�������|�r�?;�
         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
process/normal_map_invert_y=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
              [remap]

path="res://Scenes/WinScreen.gdc"
     [remap]

path="res://Scripts/Hider.gdc"
        [remap]

path="res://Scripts/NPC.gdc"
          [remap]

path="res://Scripts/NameTag.gdc"
      [remap]

path="res://Scripts/Network.gdc"
      [remap]

path="res://Scripts/NetworkSetup.gdc"
 [remap]

path="res://Scripts/Seeker.gdc"
       �PNG

   IHDR   @   @   �iq�   sRGB ���  �IDATx��ytTU��?�ի%���@ȞY1JZ �iA�i�[P��e��c;�.`Ow+4�>�(}z�EF�Dm�:�h��IHHB�BR!{%�Zߛ?��	U�T�
���:��]~�������-�	Ì�{q*�h$e-
�)��'�d�b(��.�B�6��J�ĩ=;���Cv�j��E~Z��+��CQ�AA�����;�.�	�^P	���ARkUjQ�b�,#;�8�6��P~,� �0�h%*QzE� �"��T��
�=1p:lX�Pd�Y���(:g����kZx ��A���띊3G�Di� !�6����A҆ @�$JkD�$��/�nYE��< Q���<]V�5O!���>2<��f��8�I��8��f:a�|+�/�l9�DEp�-�t]9)C�o��M~�k��tw�r������w��|r�Ξ�	�S�)^� ��c�eg$�vE17ϟ�(�|���Ѧ*����
����^���uD�̴D����h�����R��O�bv�Y����j^�SN֝
������PP���������Y>����&�P��.3+�$��ݷ�����{n����_5c�99�fbסF&�k�mv���bN�T���F���A�9�
(.�'*"��[��c�{ԛmNު8���3�~V� az
�沵�f�sD��&+[���ke3o>r��������T�]����* ���f�~nX�Ȉ���w+�G���F�,U�� D�Դ0赍�!�B�q�c�(
ܱ��f�yT�:��1�� +����C|��-�T��D�M��\|�K�j��<yJ, ����n��1.FZ�d$I0݀8]��Jn_� ���j~����ցV���������1@M�)`F�BM����^x�>
����`��I�˿��wΛ	����W[�����v��E�����u��~��{R�(����3���������y����C��!��nHe�T�Z�����K�P`ǁF´�nH啝���=>id,�>�GW-糓F������m<P8�{o[D����w�Q��=N}�!+�����-�<{[���������w�u�L�����4�����Uc�s��F�륟��c�g�u�s��N��lu���}ן($D��ת8m�Q�V	l�;��(��ڌ���k�
s\��JDIͦOzp��مh����T���IDI���W�Iǧ�X���g��O��a�\:���>����g���%|����i)	�v��]u.�^�:Gk��i)	>��T@k{'	=�������@a�$zZ�;}�󩀒��T�6�Xq&1aWO�,&L�cřT�4P���g[�
p�2��~;� ��Ҭ�29�xri� ��?��)��_��@s[��^�ܴhnɝ4&'
��NanZ4��^Js[ǘ��2���x?Oܷ�$��3�$r����Q��1@�����~��Y�Qܑ�Hjl(}�v�4vSr�iT�1���f������(���A�ᥕ�$� X,�3'�0s����×ƺk~2~'�[�ё�&F�8{2O�y�n�-`^/FPB�?.�N�AO]]�� �n]β[�SR�kN%;>�k��5������]8������=p����Ցh������`}�
�J�8-��ʺ����� �fl˫[8�?E9q�2&������p��<�r�8x� [^݂��2�X��z�V+7N����V@j�A����hl��/+/'5�3�?;9
�(�Ef'Gyҍ���̣�h4RSS� ����������j�Z��jI��x��dE-y�a�X�/�����:��� +k�� �"˖/���+`��],[��UVV4u��P �˻�AA`��)*ZB\\��9lܸ�]{N��礑]6�Hnnqqq-a��Qxy�7�`=8A�Sm&�Q�����u�0hsPz����yJt�[�>�/ޫ�il�����.��ǳ���9��
_
��<s���wT�S������;F����-{k�����T�Z^���z�!t�۰؝^�^*���؝c
���;��7]h^
��PA��+@��gA*+�K��ˌ�)S�1��(Ե��ǯ�h����õ�M�`��p�cC�T")�z�j�w��V��@��D��N�^M\����m�zY��C�Ҙ�I����N�Ϭ��{�9�)����o���C���h�����ʆ.��׏(�ҫ���@�Tf%yZt���wg�4s�]f�q뗣�ǆi�l�⵲3t��I���O��v;Z�g��l��l��kAJѩU^wj�(��������{���)�9�T���KrE�V!�D���aw���x[�I��tZ�0Y �%E�͹���n�G�P�"5FӨ��M�K�!>R���$�.x����h=gϝ�K&@-F��=}�=�����5���s �CFwa���8��u?_����D#���x:R!5&��_�]���*�O��;�)Ȉ�@�g�����ou�Q�v���J�G�6�P�������7��-���	պ^#�C�S��[]3��1���IY��.Ȉ!6\K�:��?9�Ev��S]�l;��?/� ��5�p�X��f�1�;5�S�ye��Ƅ���,Da�>�� O.�AJL(���pL�C5ij޿hBƾ���ڎ�)s��9$D�p���I��e�,ə�+;?�t��v�p�-��&����	V���x���yuo-G&8->�xt�t������Rv��Y�4ZnT�4P]�HA�4�a�T�ǅ1`u\�,���hZ����S������o翿���{�릨ZRq��Y��fat�[����[z9��4�U�V��Anb$Kg������]������8�M0(WeU�H�\n_��¹�C�F�F�}����8d�N��.��]���u�,%Z�F-���E�'����q�L�\������=H�W'�L{�BP0Z���Y�̞���DE��I�N7���c��S���7�Xm�/`�	�+`����X_��KI��^��F\�aD�����~�+M����ㅤ��	SY��/�.�`���:�9Q�c �38K�j�0Y�D�8����W;ܲ�pTt��6P,� Nǵ��Æ�:(���&�N�/ X��i%�?�_P	�n�F�.^�G�E���鬫>?���"@v�2���A~�aԹ_[P, n��N������_rƢ��    IEND�B`�       ECFG      application/config/name      	   guess-who      application/run/main_scene(         res://Scenes/NetworkSetup.tscn     application/config/icon         res://icon.png     autoload/Network$         *res://Scripts/Network.gd      display/window/size/width      �     display/window/size/height      8     display/window/size/fullscreen            display/window/stretch/mode         viewport   display/window/stretch/aspect         keep
   input/left�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      physical_scancode             unicode           echo          script         input/right�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      physical_scancode             unicode           echo          script         input/up�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   W      physical_scancode             unicode           echo          script            InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          physical_scancode             unicode           echo          script      
   input/down�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   S      physical_scancode             unicode           echo          script         input/target�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script         input/sprint�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        physical_scancode             unicode           echo          script      )   physics/common/enable_pause_aware_picking         )   rendering/environment/default_environment          res://default_env.tres                
<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="focus" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.ncl.org.br/NCL3.0/EDTVProfile
	http://www.ncl.org.br/NCL3.0/profiles/NCL30EDTV.xsd">
<head>

  <regionBase>
    <region id="regionFullscreen" width="60%" height="60%" zIndex="1" />

    <region id="regionButtons" zIndex="10">
      <region id="regionPlayerButtons">
        <region id="regionButtonGuanabara" right="0%" top="232px" width="64px" height="64px" zIndex="10" />

        <region id="rT1" left="61%" top="0%" width="39%" height="100%" zIndex="7"/>

        <region id="regionButtonSendas" right="0%" top="296px" width="64px" height="64px" zIndex="10" />
        <region id="regionButtonReal" right="0%" top="360px" width="64px" height="64px" zIndex="10" />
        <region id="regionButtonMundial" right="0%" top="424px" width="64px" height="64px" zIndex="10" />
        <region id="regionButtonClose" right="0%" top="75%" bottom="72px" width="64px" height="64px" zIndex="10" />
      </region>
    </region>
    
  </regionBase>

  <descriptorBase>
    <!-- Buttons -->
    <descriptor
      id="descriptorGuanabaraButton"
      region="regionButtonGuanabara"
      focusIndex="indexGuanabaraButton"
      moveUp="indexCloseButton" moveDown="indexSendasButton"
    />

    <descriptor
      id="descriptorSendasButton"
      region="regionButtonSendas"
      focusIndex="indexSendasButton"
      moveUp="indexGuanabaraButton" moveDown="indexRealButton"
    />
    <descriptor
      id="descriptorRealButton"
      region="regionButtonReal"
      focusIndex="indexRealButton"
      moveUp="indexSendasButton" moveDown="indexMundialButton"
    />

    <descriptor
      id="descriptorMundialButton"
      region="regionButtonMundial"
      focusIndex="indexMundialButton"
      moveUp="indexRealButton" moveDown="indexCloseButton"
    />


    <descriptor
      id="descriptorCloseButton"
      region="regionButtonClose"
      focusIndex="indexCloseButton"
      moveUp="indexMundialButton" moveDown="indexGuanabaraButton"
    />
    <!-- Videos -->
    <descriptor
      id="descriptorVideoGuanabara"
      region="regionFullscreen"
    />

    <descriptor
      id="descriptorVideoSendas"
      region="regionFullscreen"
    />

    <descriptor
      id="descriptorVideoMundial"
      region="regionFullscreen"
    />

    <descriptor
      id="descriptorVideoReal"
      region="regionFullscreen"
    />

    <!-- Textos -->

    <descriptor id="descriptorTextGuanabara" region="rT1"
     focusIndex="ixT1"
     moveRight="ixB4">
       <descriptorParam name="background" value="red"/>
    </descriptor>

    <descriptor id="descriptorTextSendas" region="rT1"
     focusIndex="ixT1"
     moveRight="ixB4">
       <descriptorParam name="background" value="red"/>
    </descriptor>

    <descriptor id="descriptorTextMundial" region="rT1"
     focusIndex="ixT1"
     moveRight="ixB4">
       <descriptorParam name="background" value="red"/>
    </descriptor>

    <descriptor id="descriptorTextReal" region="rT1"
     focusIndex="ixT1"
     moveRight="ixB4">
       <descriptorParam name="background" value="red"/>
    </descriptor>

  </descriptorBase>

  <connectorBase>
    <causalConnector id="onBeginStart">
      <simpleCondition role="onBegin"/>
      <simpleAction role="start" max="unbounded" qualifier="par"/>
    </causalConnector>

    <causalConnector id="onSelectionStop">
      <connectorParam name="value"/>
      <simpleCondition role="onSelection"/>
      <simpleAction role="stop" max="unbounded" qualifier="par"/>      
    </causalConnector>

    <causalConnector id="onChangeVideo">
      <simpleCondition role="onSelection" />
		  <connectorParam name="var"/>
      <compoundAction>
        <simpleAction role="start" max="unbounded" qualifier="par" />
        <simpleAction role="stop" max="unbounded" qualifier="par" />
      </compoundAction>
    </causalConnector>
  </connectorBase>

</head>

<body>
  <port id="entrada" component="guanabara"/>

  <!-- Buttons -->
  <media descriptor="descriptorSendasButton" id="buttonSendas" src="img/sendas.png" />
  <media descriptor="descriptorRealButton" id="buttonReal" src="img/real.png" />
  <media descriptor="descriptorGuanabaraButton" id="buttonGuanabara" src="img/guanabara.png" />
  <media descriptor="descriptorMundialButton" id="buttonMundial" src="img/mundial.png" />
  <media descriptor="descriptorCloseButton" id="buttonClose" src="img/stop.png" />

  <!-- Videos -->
  <media id="guanabara" descriptor="descriptorVideoGuanabara" src="video/guanabara.mp4" />
  <media id="sendas" descriptor="descriptorVideoSendas" src="video/sendas.mp4" />
  <media id="mundial" descriptor="descriptorVideoMundial" src="video/mundial.mp4" />
  <media id="real" descriptor="descriptorVideoReal" src="video/real.mp4" />

  <!-- Textos -->
  <media descriptor="descriptorTextGuanabara" id="enderecoGuanabara" src="txt/guanabara.txt">
    <property name="fontUri"/>
    <property name="fontColor"/>
    <property name="fontSize" value="20"/>
  </media>

  <media descriptor="descriptorTextSendas" id="enderecoSendas" src="txt/sendas.txt">
    <property name="fontUri"/>
    <property name="fontColor"/>
    <property name="fontSize" value="20"/>
  </media>

  <media descriptor="descriptorTextMundial" id="enderecoMundial" src="txt/mundial.txt">
    <property name="fontUri"/>
    <property name="fontColor"/>
    <property name="fontSize" value="20"/>
  </media>

  <media descriptor="descriptorTextReal" id="enderecoReal" src="txt/real.txt">
    <property name="fontUri"/>
    <property name="fontColor"/>
    <property name="fontSize" value="20"/>
  </media>

  <link xconnector="onBeginStart">
    <bind component="guanabara" role="onBegin" />
    <!-- Videos -->
    <bind component="guanabara" role="start" />
    <!-- Buttons -->
    <bind component="buttonSendas" role="start" />
    <bind component="buttonGuanabara" role="start" />
    <bind component="buttonMundial" role="start" />
    <bind component="buttonReal" role="start" />
    <bind component="buttonClose" role="start" />
    <bind component="enderecoGuanabara" role="start" />
    

  </link>

  <link xconnector="onChangeVideo">
    <bind component="buttonSendas" role="onSelection" />
    <!-- Videos -->
    <bind component="sendas" role="start" />
    <bind component="guanabara" role="stop" />
    <bind component="mundial" role="stop" />
    <bind component="real" role="stop" />

    <!-- Textos -->
    <bind component="enderecoGuanabara" role="stop" />
    <bind component="enderecoSendas" role="start" />
    <bind component="enderecoMundial" role="stop" />
    <bind component="enderecoReal" role="stop" />
  </link>

  <link xconnector="onChangeVideo">
    <bind component="buttonGuanabara" role="onSelection" />
    <!-- Videos -->
    <bind component="sendas" role="stop" />
    <bind component="guanabara" role="start" />
    <bind component="mundial" role="stop" />
    <bind component="real" role="stop" />

    <bind component="enderecoGuanabara" role="start" />
    <bind component="enderecoSendas" role="stop" />
    <bind component="enderecoMundial" role="stop" />
    <bind component="enderecoReal" role="stop" />
  </link>

  <link xconnector="onChangeVideo">
    <bind component="buttonMundial" role="onSelection" />
    <!-- Videos -->
    <bind component="sendas" role="stop" />
    <bind component="guanabara" role="stop" />
    <bind component="real" role="stop" />
    <bind component="mundial" role="start" />

    <!-- Textos -->
    <bind component="enderecoGuanabara" role="stop" />
    <bind component="enderecoSendas" role="stop" />
    <bind component="enderecoMundial" role="start" />
    <bind component="enderecoReal" role="stop" />
  </link>

  <link xconnector="onChangeVideo">
    <bind component="buttonReal" role="onSelection" />
    <!-- Videos -->
    <bind component="sendas" role="stop" />
    <bind component="guanabara" role="stop" />
    <bind component="mundial" role="stop" />
    <bind component="real" role="start" />

    <!-- Textos -->
    <bind component="enderecoGuanabara" role="stop" />
    <bind component="enderecoSendas" role="stop" />
    <bind component="enderecoMundial" role="stop" />
    <bind component="enderecoReal" role="start" />
  </link>

  <link id="linkClose" xconnector="onSelectionStop">
    <bind component="buttonClose" role="onSelection" />
    <!-- Buttons -->
    <bind component="buttonClose" role="stop" />
    <bind component="buttonGuanabara" role="stop" />
    <bind component="buttonSendas" role="stop" />
    <bind component="buttonMundial" role="stop" />
    <bind component="buttonReal" role="stop" />
    <!-- Videos -->
    <bind component="sendas" role="stop" />
    <bind component="guanabara" role="stop" />
    <bind component="mundial" role="stop" />
    <bind component="real" role="stop" />

    <!-- Textos -->
    <bind component="enderecoGuanabara" role="stop" />
    <bind component="enderecoSendas" role="stop" />
    <bind component="enderecoMundial" role="stop" />
    <bind component="enderecoReal" role="stop" />
  </link>

</body>
</ncl>

package
{

    import flash.net.NetConnection;
    import flash.net.ObjectEncoding;
    import flash.events.NetStatusEvent;
    import flash.display.Sprite;

    public class Red5FirstClient extends Sprite
    {

        private var nc:NetConnection;

        public function Red5FirstClient()
        {

            // new netconnection

            nc = new NetConnection( );

            // set encoding to old amf

            nc.objectEncoding = ObjectEncoding.AMF0;

            // netstatus event listening

            nc.addEventListener( NetStatusEvent.NET_STATUS , netStatus );

            // connect to red5, passing false as parameter

            nc.connect( "rtmp://10.0.2.2/firstapp" , true );

        }

        private function netStatus ( event:NetStatusEvent ):void
        {

            trace( event.info.code );

            if ( event.info.code == "NetConnection.Connect.Rejected" )
            {

                // trace reject message

                trace( event.info.application );

            }

        }

    }

}
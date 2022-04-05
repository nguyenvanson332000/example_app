$( document ).ready( function ()
{

    $( document ).on( 'click', '.comment-submit', function ()
    {
        // lay id bai post
        var micropostId = $( this ).closest( ".micropost" ).data( "id" );
        //lay noi dung input
        var content = $( this ).siblings( ".comment-content" ).val()

        $.ajax( {
            url: '/comments',
            type: 'POST',
            data: {
                comment: {
                    micropost_id: micropostId,
                    comment_content: content
                }
            },
            dataType: 'JSON',
            success: function ( data )
            {
                appendText( data.comment.comment_content, micropostId )
            }
        } )
    } );

    function appendText ( text, micropostId )
    {
        var txt1 = "<p>" + text + "</p>";
        $( '.comments-' + micropostId ).append( txt1 );
    }
} );

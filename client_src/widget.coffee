{request, _, gl_mat, r_aj, React, React_DOM, rr, c, shortid, assign, keys, mat3, vec3, vec2} = require('./boilerplate.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse, pattern} = React.DOM

filter = React.createFactory 'filter'
# feGaussianBlur = React.createElement 'feGaussianBlur'
feGaussianBlur = React.createFactory 'feGaussianBlur'
feImage = React.createFactory 'feImage'

mock = require '../mock/mock_000.coffee'
module.exports = widget = rr

    componentDidMount: ->
        # c 'hi'
        obj = JSON.parse mock
        c 'obj', obj
        data = obj.data



        widget_schema_000 =
            display_name: "Tracy Yamamoto"


            accounts:  "three different accounts each with associated reviews"
            reviews_visible: "can  "
            active_tab : "can be an integer in [0 .. 2]"

        @setState
            mouse_on_tab: -1 # int in [0 .. 2] indicating mouseovertab or -1 none
            active_tab: 0 # int in [0 .. 2]
            star_count: 3.5
            display_name: data.display_name
            total_rating: data.total_rating.toString().substr(0, 4)
            facebook_connections: data.social_information.connections

        # request
        # .get "
        # http://api.erated.co/v1/users/bf2ec2098ca8bc146be3eb3fcaab5b53b69075cf"
        # .query {partner: '12341234'}
        # .query {mode: 'marketplaces'}
        # .end (err, res)=>
        #     data = JSON.parse(res.text).data
        #     # c 'data', data
        #     c 'data.relevant_reputation', data.relevant_reputation

            # @setState
            #     data: data
            #     relevant_reputation: data.relevant_reputation

    componentWillReceiveProps: (next_props)->
        # basically the only dynamic state we need to worry about is which tab is pressed
        # disregarding push updates for the time being, all the other data on the widget will
        # be loaded once and will stay put.
        # there will also be some animation state
        @setState
            M: next_props.M

    getInitialState: ->
        M: @props.M

    rect_t: (subj_rect)->
        {width, height, x, y} = subj_rect
        origin: vec2.transformMat3 vec2.create(), [x, y], @state.M
        width: width * @state.M[0]
        height: -(height * @state.M[4])

    line_t: (subj_line)->
        {x1, y1, x2, y2} = subj_line
        origin_1 = vec2.transformMat3 vec2.create(), [x1, y1], @state.M
        origin_2 = vec2.transformMat3 vec2.create(), [x2, y2], @state.M
        x1: origin_1[0]
        y1: origin_1[1]
        x2: origin_2[0]
        y2: origin_2[1]

    text_t: (subj_text)->
        {font_size, text_width, x, y} = subj_text
        origin: vec2.transformMat3 vec2.create(), [x, y], @state.M
        text_width: text_width * @state.M[0]
        font_size: -(font_size * @state.M[4])

    circle_t: (subj_circle)->
        {x, y, r} = subj_circle
        origin: vec2.transformMat3 vec2.create(), [x, y], @state.M
        r: @state.M[0] * r

    area_rect: ->
        subj =
            width: 200
            height: 48.39
            x: -100
            y: 24.195
        @rect_t subj

    top_yellow_bar_rect: ->
        subj =
            width: 200
            height: 2.89
            x: -100
            y: 23.368
        @rect_t subj

    overview_main_area: ->
        subj =
            width: 65.77
            height: 44.467
            x: -100
            y: 20.47215
        @rect_t subj

    social_media_area: ->
        subj =
            width: 65.77
            height: 15.925
            x: -100
            y: -8.06
        @rect_t subj

    portrait_photo_border: ->
        subj =
            x: -90.693
            y: 11.7855
            r: 7.44
        @circle_t subj

    portrait_ring_circle: ->
        subj =
            x: -77.33
            y: 11.7855
            r: 7.3
        @circle_t subj

    positivity_count_text: ->
        subj =
            font_size: 3.309
            text_width: 11.99
            x: -83.12
            y: 12.48
        @text_t subj

    positive_text: ->
        subj =
            font_size: 3.309
            text_width: 11.99
            x: -83.12
            y: 9.09
        @text_t subj

    portrait_photo_square: ->
        subj =
            x: -98.7
            y: 19.8
            width: 14.88
            height: 14.88
        @rect_t subj

    portrait_photo_circle: ->
        subj =
            x: -90.7
            y: 11.7855
            r: 7.3
        @circle_t subj

    top_merchant_img: ->
        subj =
            x: -49.13
            y: 18.0
            width:14
            height: 14
        @rect_t subj

    username_banner: ->
        subj =
            x: -95.3
            y: 0
            font_size: 2.5
            text_width: 27
        @text_t subj

    positive_feedback_banner: ->
        subj =
            x: -95.3
            y: -3
            font_size: 2.3
            text_width: 29
        @text_t subj

    facebook_logo: ->
        subj =
            x: -89.4
            y: -9.72
            width: 2.89
            height: 2.89
        @rect_t subj

    facebook_number: ->
        subj =
            x: -88
            y: -15.98
            text_width: 3.89
            font_size: 2.89
        @text_t subj

    facebook_friends_tag: ->
        subj =
            x: -88
            y: -18.98
            text_width: 3.89
            font_size: 2.89
        @text_t subj

    social_info_separator_1: ->
        subj =
            x1: -79.934
            y1: -18.98
            x2: -79.934
            y2: -13.18
        @line_t subj

    linkedIn_logo: ->
        subj =
            x: -70.17
            y: -9.72
            width: 2.89
            height: 2.89
        @rect_t subj

    linkedIn_number: ->
        subj =
            x: -69
            y: -15.98
            text_width: 3.89
            font_size: 2.89
        @text_t subj

    linkedIn_connections_tag: ->
        subj =
            x: -69
            y: -18.98
            text_width: 3.89
            font_size: 2.89
        @text_t subj

    social_info_separator_2: ->
        subj =
            x1: -56.77353
            y1: -18.98
            x2: -56.77353
            y2: -13.18
        @line_t subj

    twitter_logo: ->
        subj =
            x: -48
            y: -9.72
            width: 2.89
            height: 2.89
        @rect_t subj

    twitter_number: ->
        subj =
            x: -46.6
            y: -15.98
            text_width: 3.89
            font_size: 2.89
        @text_t subj


    twitter_followers_tag: ->
        subj =
            x: -46.6
            y: -18.98
            text_width: 3.89
            font_size: 2.89
        @text_t subj

    main_separator_one: ->
        subj =
            x1: -34.6432
            y1: 20.4757
            x2: -34.6432
            y2: -24.19855
        @line_t subj

    transactions_assess_area: ->
        subj =
            width: 65.77
            height: 21.929999
            x: -34.64
            y: -2.062
        @rect_t subj

    stars_count_area: ->
        subj =
            width: 65.77
            height: 13.23
            x: -34.64
            y: 10.8
        @rect_t subj



    stars_number: ->
        subj =
            x: -29.5
            y: .5
            font_size: 7.03
            text_width: 13.44
        @text_t subj

    star_one: ->
        subj =
            x: -12.3
            y: 7.1
            width: 7.7
            height: 7.7
        @rect_t subj


    # clip_half_one: ->

    star_two: ->
        subj =
            x: -3.62
            y: 7.1
            width: 7.7
            height: 7.7
        @rect_t subj

    # clip_half_two: ->

    star_three: ->
        subj =
            x: 5.06
            y: 7.1
            width: 7.7
            height: 7.7
        @rect_t subj

    # clip_path_three: ->

    star_four: ->
        subj =
            x: 13.73
            y: 7.1
            width: 7.7
            height: 7.7
        @rect_t subj

    clip_path_four: ->

    star_five: ->
        subj =
            x: 22.41
            y: 7.1
            width: 7.7
            height: 7.7
        @rect_t subj

    clip_path_five: ->




    reviews_rect: ->
        subj =
            width: 68.87
            height: 44.467
            x: 31.13
            y: 20.47215
        @rect_t subj

    reviews_scroller: ->
        subj =
            width: 68.87
            height: 35.16
            x: 31.13
            y: 11.168
        @rect_t subj

    tab_one: ->
        subj =
            width: 20.687
            height: 9.72
            x: -34.64
            y: 20.47215
        @rect_t subj

    tab_one_image: ->
        subj =
            x: -34
            y: 20
            width: 18
            height: 10
        @rect_t subj

    tab_two: ->
        subj =
            width: 24.405
            height: 9.72
            x: -13.953
            y: 20.47215
        @rect_t subj

    tab_two_image: ->
        subj =
            x: -12
            y: 19.3
            width: 20
            height: 8
        @rect_t subj

    tab_three: ->
        subj =
            width: 20.687
            height: 9.72
            x: 10.452
            y: 20.47215
        @rect_t subj

    tab_three_image: ->
        subj =
            x: 11
            y: 18.8
            width: 20
            height: 8
        @rect_t subj

    tabs_area: ->
        subj =
            width: 65.77
            height: 35.16
            x: -34.64
            y: 11.168
        @rect_t subj



    review_blurb_area: (pos) ->
        # pos can be 0 to 2 (there are 3 positions available)
        y_pos = (pos)->
            return 11.168 - (pos * 11.719)
        subj =
            width: 68.7
            height: 11.719
            x: 31.13
            y: y_pos(pos)
        @rect_t subj

    review_blurb_text: (pos)->
        y_pos = (pos)->
            return 10 - (pos * 11.719)
        subj =
            x: 10
            y: y_pos(pos)


    reviews_title: ->
        subj =
            font_size: 5.377
            text_width: 25.439
            x: 37.33
            y: 14.7
        @text_t subj


    reviews_number: ->
        subj =
            text_width: 8.89
            font_size: 2.89
            x: 65.45
            y: 14.7
        @text_t subj



    render: ->

        area_rect = @area_rect()
        top_yellow_bar_rect = @top_yellow_bar_rect()
        reviews_rect = @reviews_rect()
        reviews_title = @reviews_title()
        reviews_number = @reviews_number()
        reviews_scroller = @reviews_scroller()
        tabs_area = @tabs_area()
        tab_one = @tab_one() ; tab_two = @tab_two() ; tab_three = @tab_three()
        tab_one_image = @tab_one_image()
        tab_two_image = @tab_two_image()
        tab_three_image = @tab_three_image()
        stars_count_area = @stars_count_area()
        transactions_assess_area = @transactions_assess_area()
        overview_main_area = @overview_main_area()
        portrait_photo_square = @portrait_photo_square()
        portrait_photo_border = @portrait_photo_border()
        portrait_ring_circle = @portrait_ring_circle()
        portrait_photo_circle = @portrait_photo_circle()
        positivity_count_text = @positivity_count_text()
        positive_text = @positive_text()
        top_merchant_img = @top_merchant_img()
        username_banner = @username_banner()
        positive_feedback_banner = @positive_feedback_banner()
        facebook_logo = @facebook_logo()
        linkedIn_logo = @linkedIn_logo()
        twitter_logo = @twitter_logo()
        facebook_number = @facebook_number()
        facebook_friends_tag = @facebook_friends_tag()
        social_info_separator_1 = @social_info_separator_1()
        social_info_separator_2 = @social_info_separator_2()
        linkedIn_number = @linkedIn_number()
        linkedIn_connections_tag = @linkedIn_connections_tag()
        twitter_number = @twitter_number()
        twitter_followers_tag = @twitter_followers_tag()
        stars_number = @stars_number()
        social_media_area = @social_media_area()
        star_one = @star_one()
        star_two = @star_two()
        star_three = @star_three()
        star_four = @star_four()
        star_five = @star_five()
        main_separator_one = @main_separator_one()


        svg
            width: '100%'
            height: '100%'
        ,

    # <filter id="f1" x="0" y="0">
    #   <feGaussianBlur in="SourceGraphic" stdDeviation="15" />
    # </filter>

# <svg width="700" height="660">
#     <filter id="this_image" x="0%" y="0%" width="100%" height="100%">
#         <feImage xlink:href="test_image.png"/>
#     </filter>
#     <circle filter="url(#this_image)" cx="180" cy="120" r="80" />
# </svg>

        # <defs>
        #     <pattern id="Triangle"
        #              width="10" height="10"
        #              patternUnits="userSpaceOnUse">
        #         <polygon points="5,0 10,10 0,10"/>
        #     </pattern>
        # </defs>

    # <defs>
    #     <clipPath id="myClip">
    #         <circle cx="30" cy="30" r="20"/>
    #         <circle cx="70" cy="70" r="20"/>
    #     </clipPath>
    # </defs>
            defs
                # clipPath
                #     id: 'star_one_halve'
                # easier just

                pattern
                    id: 'triangle'
                    width: 10
                    height: 10
                    patternUnits: 'userSpaceOnUse'
                    ,
                    # polygon
                    #     points: "5,0 10,10 0,10"
                    line
                        x1: 2
                        y1: 8
                        x2: 8
                        y2: 0
                        stroke: 'lightgrey'
                        'stroke-width': .28
        #             path
        #                 d="M-10,10 l2,-2
        #    M0,4 l4,-4
        #    M3,5 l2,-2"

                filter
                    id: 'portrait_image'
                    x: '0%'
                    y: '0%'
                    width: '100%'
                    height: '100%'
                    ,
                    feImage
                        xlinkHref: 'file:../assets/portrait.png'
                filter
                    id: 'f1'
                    x: 0
                    y: 0
                    ,
                    feGaussianBlur
                        in: 'SourceGraphic'
                        stdDeviation: 15


                # pattern
                #     id: 'pimg'
                #     #
                #     # width: 10
                #     # height: 10
                #     # patternUnits: 'userSpaceOnUse'
                #     ,
                #         image
                #         #     x: 0
                #         #     y: 0
                #         #     width: 100
                #         #     height: 100
                #             # xlinkHref: 'file:../assets/mwdJ3x17.jpg'
                #             xlinkHref: 'file:../assets/dhgatelogo.png'

# <svg width="700" height="660">
#   <defs>
#     <pattern id="image" x="0" y="0" patternUnits="userSpaceOnUse" height="1" width="1">
#       <image x="0" y="0" xlink:href="url.png"></image>
#     </pattern>
#   </defs>
#   <circle id='top' cx="180" cy="120" r="80" fill="url(#image)"/>
# </svg>
            rect
                x: area_rect.origin[0]
                y: area_rect.origin[1]
                width: area_rect.width
                height: area_rect.height
                fill: '#F6F6F6'
            rect
                x: top_yellow_bar_rect.origin[0]
                y: top_yellow_bar_rect.origin[1]
                width: top_yellow_bar_rect.width
                height: top_yellow_bar_rect.height
                fill: '#EFBD00'

            rect
                x: overview_main_area.origin[0]
                y: overview_main_area.origin[1]
                width: overview_main_area.width
                height: overview_main_area.height
                # fill: 'blue'
                fill: 'url(#triangle)'


            rect
                x: social_media_area.origin[0]
                y: social_media_area.origin[1]
                width: social_media_area.width
                height: social_media_area.height
                fill: 'lightblue'
                fill: '#FFFFFF'

            # circle
            #     cx: portrait_photo_circle.origin[0]
            #     cy: portrait_photo_circle.origin[1]
            #     r: portrait_photo_circle.r
            #     fill: 'black'
            #     fill: "url(#pimg)"
            #     stroke: 'white'
            circle
                cx: portrait_ring_circle.origin[0]
                cy: portrait_ring_circle.origin[1]
                r: portrait_ring_circle.r
                'fill-opacity': 0
                'stroke-width': portrait_ring_circle.r / 20
                stroke: 'orange'
            text
                x: positivity_count_text.origin[0]
                y: positivity_count_text.origin[1]
                'font-size': positivity_count_text.font_size
                textLength: positivity_count_text.text_width
                fill: 'orange'
                ,
                "#{@state.total_rating}%"
            text
                x: positive_text.origin[0]
                y: positive_text.origin[1]
                'font-size': positive_text.font_size
                textLength: positive_text.text_width
                fill: 'grey'
                ,
                "Positive"
            circle
                cx: portrait_photo_circle.origin[0]
                cy: portrait_photo_circle.origin[1]
                r: portrait_photo_circle.r
                filter: 'url(#portrait_image)'
            circle
                cx: portrait_photo_circle.origin[0]
                cy: portrait_photo_circle.origin[1]
                r: portrait_photo_circle.r
                stroke: 'grey'
                'stroke-width': portrait_photo_circle.r / 20
                'fill-opacity': 0
            # image
            #     x: portrait_photo_square.origin[0]
            #     y: portrait_photo_square.origin[1]
            #     width: portrait_photo_square.width
            #     height: portrait_photo_square.height
            #     xlinkHref: 'file:../assets/portrait.png'
            # circle
            #     cx: portrait_photo_border.origin[0]
            #     cy: portrait_photo_border.origin[1]
            #     r: portrait_photo_border.r
            #     stroke: 'white'
            #     fillOpacity: 0

            image
                x: top_merchant_img.origin[0]
                y: top_merchant_img.origin[1]
                width: top_merchant_img.width
                height: top_merchant_img.height
                xlinkHref: 'file:../assets/dhgicon.png'

            text
                x: username_banner.origin[0]
                y: username_banner.origin[1]
                'font-size': username_banner.font_size
                textLength: username_banner.text_width
                fill: 'grey'
                ,
                    @state.display_name
            text
                x: positive_feedback_banner.origin[0]
                y: positive_feedback_banner.origin[1]
                'font-size': positive_feedback_banner.font_size
                textLength: positive_feedback_banner.text_width
                fill: 'grey'
                ,
                    "#{@state.total_rating}% positive feedback"

            image
                x: facebook_logo.origin[0]
                y: facebook_logo.origin[1]
                width: facebook_logo.width
                height: facebook_logo.height
                xlinkHref: 'file:../assets/facebook.svg'
            text
                x: facebook_number.origin[0]
                y: facebook_number.origin[1]
                'font-size': facebook_number.font_size
                # textLength: twitter_number.text_width
                fill: 'grey'
                'text-anchor': 'middle'
                ,
                "654"
            text
                x: facebook_friends_tag.origin[0]
                y: facebook_friends_tag.origin[1]
                'font-size': facebook_friends_tag.font_size
                fill: 'grey'
                'text-anchor': 'middle'
                ,
                "Friends"
            line
                x1: social_info_separator_1.x1
                y1: social_info_separator_1.y1
                x2: social_info_separator_1.x2
                y2: social_info_separator_1.y2
                stroke: 'lightgrey'
            image
                x: linkedIn_logo.origin[0]
                y: linkedIn_logo.origin[1]
                width: linkedIn_logo.width
                height: linkedIn_logo.height
                xlinkHref: 'file:../assets/linkedin.svg'
            text
                x: linkedIn_number.origin[0]
                y: linkedIn_number.origin[1]
                'font-size': linkedIn_number.font_size
                fill: 'grey'
                'text-anchor': 'middle'
                ,
                "238"
            text
                x: linkedIn_connections_tag.origin[0]
                y: linkedIn_connections_tag.origin[1]
                'font-size': linkedIn_connections_tag.font_size
                fill: 'grey'
                'text-anchor': 'middle'
                ,
                "Connections"
            line
                x1: social_info_separator_2.x1
                y1: social_info_separator_2.y1
                x2: social_info_separator_2.x2
                y2: social_info_separator_2.y2
                stroke: 'lightgrey'
            image
                x: twitter_logo.origin[0]
                y: twitter_logo.origin[1]
                width: twitter_logo.width
                height: twitter_logo.height
                xlinkHref: 'file:../assets/twitter.svg'
            text
                x: twitter_number.origin[0]
                y: twitter_number.origin[1]
                'font-size': twitter_number.font_size
                fill: 'grey'
                'text-anchor': 'middle'
                ,
                "346"
            text
                x: twitter_followers_tag.origin[0]
                y: twitter_followers_tag.origin[1]
                'font-size': twitter_followers_tag.font_size
                fill: 'grey'
                'text-anchor': 'middle'
                ,
                "Followers"


            line
                x1: main_separator_one.x1
                y1: main_separator_one.y1
                x2: main_separator_one.x2
                y2: main_separator_one.y2
                'stroke-width': .5
                stroke: 'lightgrey'


            # rect
            #     x: tabs_area.origin[0]
            #     y: tabs_area.origin[1]
            #     width: tabs_area.width
            #     height: tabs_area.height
            #     fill: 'purple'

            rect
                x: tab_one.origin[0]
                y: tab_one.origin[1]
                width: tab_one.width
                height: tab_one.height
                fill: if @state.active_tab is 0 then 'url(#triangle)' else 'lightgrey'
            image
                x: tab_one_image.origin[0]
                y: tab_one_image.origin[1]
                width: tab_one_image.width
                height: tab_one_image.height
                xlinkHref: 'file:../assets/dhgatelogo.png'
            rect
                x: tab_two.origin[0]
                y: tab_two.origin[1]
                width: tab_two.width
                height: tab_two.height
                fill: if @state.active_tab is 1 then 'url(#triangle)' else 'lightgrey'
                onClick: -> c 'test'
            image
                x: tab_two_image.origin[0]
                y: tab_two_image.origin[1]
                width: tab_two_image.width
                height: tab_two_image.height
                xlinkHref: 'file:../assets/ebaycolor.png'
            rect
                x: tab_three.origin[0]
                y: tab_three.origin[1]
                width: tab_three.width
                height: tab_three.height
                fill: if @state.active_tab is 2 then 'url(#triangle)' else 'lightgrey'
            image
                x: tab_three_image.origin[0]
                y: tab_three_image.origin[1]
                width: tab_three_image.width
                height: tab_three_image.height
                xlinkHref: 'file:../assets/etsygrey.png'

            rect
                x: stars_count_area.origin[0]
                y: stars_count_area.origin[1]
                width: stars_count_area.width
                height: stars_count_area.height
                fill: 'url(#triangle)'
                opacity: 0.6

            text
                x: stars_number.origin[0]
                y: stars_number.origin[1]
                'font-size': stars_number.font_size
                fill: 'grey'
                'text-length': stars_number.text_width
                ,
                "#{@state.star_count}"

            if @state.star_count > 0
                image
                    x: star_one.origin[0]
                    y: star_one.origin[1]
                    width: if @state.star_count < 1 then star_one.width / 2 else star_one.width
                    height: star_one.height
                    xlinkHref: if @state.star_count < 1
                        'file:../assets/halfstar.png'
                    else
                        'file:../assets/star.png'

            if @state.star_count > 1
                image
                    x: star_two.origin[0]
                    y: star_two.origin[1]
                    width: if @state.star_count < 2 then star_two.width / 2 else star_two.width
                    height: star_two.height
                    xlinkHref: if @state.star_count < 2
                        'file:../assets/halfstar.png'
                    else
                        'file:../assets/star.png'

            if @state.star_count > 2
                image
                    x: star_three.origin[0]
                    y: star_three.origin[1]
                    width: if @state.star_count < 3 then star_three.width / 2 else star_three.width
                    height: star_three.height
                    xlinkHref: if @state.star_count < 3
                        'file:../assets/halfstar.png'
                    else
                        'file:../assets/star.png'

            if @state.star_count > 3
                image
                    x: star_four.origin[0]
                    y: star_four.origin[1]
                    width: if @state.star_count < 4 then star_four.width / 2 else star_four.width
                    height: star_four.height
                    xlinkHref: if @state.star_count < 4
                        'file:../assets/halfstar.png'
                    else
                        'file:../assets/star.png'

            if @state.star_count > 4
                image
                    x: star_five.origin[0]
                    y: star_five.origin[1]
                    width: if @state.star_count < 5 then star_five.width / 2 else star_five.width
                    height: star_five.height
                    xlinkHref: if @state.star_count < 5
                        'file:../assets/halfstar.png'
                    else
                        'file:../assets/star.png'

            # circle
            #     cx: star_one.origin[0]
            #     cy: star_one.origin[1]
            #     r: 3


            rect
                x: transactions_assess_area.origin[0]
                y: transactions_assess_area.origin[1]
                width: transactions_assess_area.width
                height: transactions_assess_area.height
                fill: 'url(#triangle)'
                opacity: 0.69


            rect
                x: reviews_rect.origin[0]
                y: reviews_rect.origin[1]
                width: reviews_rect.width
                height: reviews_rect.height
                fill: 'yellow'
            rect
                x: reviews_scroller.origin[0]
                y: reviews_scroller.origin[1]
                width: reviews_scroller.width
                height: reviews_scroller.height
                fill: 'lightblue'
            text
                x: reviews_title.origin[0]
                y: reviews_title.origin[1]
                'font-size': reviews_title.font_size
                'font-family': 'Helvetica'
                fill: '#7D7D7D'
                textLength: reviews_title.text_width
                ,
                "Reviews"
            text
                x: reviews_number.origin[0]
                y: reviews_number.origin[1]
                'font-size': reviews_number.font_size
                'font-family': 'Verdana'
                fill: '#666666'
                textLength: reviews_number.text_width
                ,
                "(+388)"

            for i in [0 .. 2]
                review_blurb_area = @review_blurb_area(i)
                temp_color = switch i
                    when 0 then 'green'
                    when 1 then 'blue'
                    when 2 then 'lightgreen'

                rect
                    key: "review_blurb#{i}"
                    x: review_blurb_area.origin[0]
                    y: review_blurb_area.origin[1]
                    width: review_blurb_area.width
                    height: review_blurb_area.height
                    fill: temp_color


# module.exports = widget

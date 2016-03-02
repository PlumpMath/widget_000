{request, _, gl_mat, r_aj, React, React_DOM, rr, c, shortid, assign, keys, mat3, vec3, vec2} = require('./boilerplate.coffee')()

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse, pattern} = React.DOM


c 'pattern', pattern
c 'filter', filter

mock = require '../mock/mock_000.coffee'
module.exports = widget = rr

    componentDidMount: ->
        # c 'hi'
        obj = JSON.parse mock
        c 'obj', obj

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
        @setState
            M: next_props.M

    getInitialState: ->
        M: @props.M

    rect_t: (subj_rect)->
        {width, height, x, y} = subj_rect
        origin: vec2.transformMat3 vec2.create(), [x, y], @state.M
        width: width * @state.M[0]
        height: -(height * @state.M[4])

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

    portrait_photo_border: ->
        subj =
            x: -90.693
            y: 11.7855
            r: 7.44
        @circle_t subj

    portrait_ring_circle: ->
        subj =
            x: -78.84
            y: 11.7855
            r: 7.3
        @circle_t subj

    portrait_photo_square: ->
        subj =
            x: -98.7
            y: 19.8
            width: 14.88
            height: 14.88
        @rect_t subj





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
            x: -13
            y: 20
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
            y: 18
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

    stars_count_area: ->
        subj =
            width: 65.77
            height: 13.23
            x: -34.64
            y: 10.8
        @rect_t subj

    transactions_assess_area: ->
        subj =
            width: 65.77
            height: 21.929999
            x: -34.64
            y: -2.062
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

    positivity_count_text: ->
        subj =
            font_size: 3.309
            text_width: 11.99
            x: -84.12
            y: 12.48
        @text_t subj

    positive_text: ->
        subj =
            font_size: 3.309
            text_width: 11.99
            x: -84.12
            y: 9.09
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
        positivity_count_text = @positivity_count_text()
        positive_text = @positive_text()

        svg
            width: '100%'
            height: '100%'
        ,
            defs
                pattern
                    id: 'pimg'
                    #
                    # width: 10
                    # height: 10
                    # patternUnits: 'userSpaceOnUse'
                    ,
                        image
                        #     x: 0
                        #     y: 0
                        #     width: 100
                        #     height: 100
                            # xlinkHref: 'file:../assets/mwdJ3x17.jpg'
                            xlinkHref: 'file:../assets/dhgatelogo.png'

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
                fill: 'blue'

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
                # fillOpacity: 0
                fill: 'url(#ping)'
                stroke: 'orange'
            text
                x: positivity_count_text.origin[0]
                y: positivity_count_text.origin[1]
                'font-size': positivity_count_text.font_size
                textLength: positivity_count_text.text_width
                fill: 'orange'
                ,
                    "99.6%"
            text
                x: positive_text.origin[0]
                y: positive_text.origin[1]
                'font-size': positive_text.font_size
                textLength: positive_text.text_width
                fill: 'grey'
                ,
                    "Positive"
            image
                x: portrait_photo_square.origin[0]
                y: portrait_photo_square.origin[1]
                width: portrait_photo_square.width
                height: portrait_photo_square.height
                xlinkHref: 'file:../assets/portrait.png'
            # circle
            #     cx: portrait_photo_border.origin[0]
            #     cy: portrait_photo_border.origin[1]
            #     r: portrait_photo_border.r
            #     stroke: 'white'
            #     fillOpacity: 0





            rect
                x: tabs_area.origin[0]
                y: tabs_area.origin[1]
                width: tabs_area.width
                height: tabs_area.height
                fill: 'purple'

            rect
                x: tab_one.origin[0]
                y: tab_one.origin[1]
                width: tab_one.width
                height: tab_one.height
                fill: 'orange'
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
                fill: 'grey'
                onClick: -> c 'here!!!!!!!!!!!!!!!!!!!'
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
                fill: 'green'
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
                fill: 'white'
                opacity: 0.6

            rect
                x: transactions_assess_area.origin[0]
                y: transactions_assess_area.origin[1]
                width: transactions_assess_area.width
                height: transactions_assess_area.height
                fill: 'grey'
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
                    x: review_blurb_area.origin[0]
                    y: review_blurb_area.origin[1]
                    width: review_blurb_area.width
                    height: review_blurb_area.height
                    fill: temp_color


# module.exports = widget

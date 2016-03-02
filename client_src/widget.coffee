

{superagent, _, gl_mat, r_aj, React, React_DOM, rr, c, shortid, assign, keys} = require('./boilerplate.coffee')()

root = document.getElementById 'root'

# require('./monkey_patch.coffee')


{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse} = React.DOM



# c "React", React
# c "React.version", React.version
# c 'foreignObject', foreignObject
# c 'filter', filter
# c 'text', text
# c 'circle', circle
# c 'rect', rect
# c 'svg', svg
# c 'React.DOM', React.DOM



mat3 = gl_mat.mat3
vec3 = gl_mat.vec3
vec2 = gl_mat.vec2


main = rr

    componentWillUnmount: ->
        window.onresize = null

    set_boundingRect: ->
        @forceUpdate()
        bounding_rect = React_DOM.findDOMNode(@).getBoundingClientRect()
        @setState
            view_width: bounding_rect.width
            view_height: bounding_rect.height
            x: bounding_rect.width / 2 # transform coordinate system
            y: bounding_rect.height / 2 # translation of coordinate

    debounce: (func, wait, immediate) ->
        timeout = 'scoped here'
        ->
            context = @
            args = arguments
            later = ->
                timeout = null
                if not(immediate) then func.apply(context, args)
            callNow = immediate and not(timeout)
            clearTimeout(timeout)
            timeout = setTimeout(later, wait)
            if callNow then func.apply(context, args)

    debounced_set_boundingRect: -> @debounce(@set_boundingRect, 200)()

    componentDidMount: ->
        @set_boundingRect()
        window.onresize = @debounced_set_boundingRect

    blurb_payload: (square_side, msg_number)->
        M_002 = [
            square_side, 0, 0,
            0, -square_side, 0,
            (@state.view_width / 4), (50 - (@state.view_height / 10 * msg_number)), 1
        ]
        M: M_002

    payload_003: ->
        M_003 = [
            @state.view_width / 200, 0, 0,
            0, -@state.view_width / 200, 0,
            (@state.view_width / 2), (@state.view_height / 2), 1
        ]


    payload_002: (square_side)->
        M_002 = [
            square_side, 0, 0,
            0, -square_side, 0,
            (@state.view_width / 2), (@state.view_height / 2), 1
        ]
        M: M_002

    getInitialState: ->
        messages: []
    send_message: (message)->
        rayy = @state.messages
        rayy.push message
        @setState
            messages: rayy


    render: ->

        # payload_000 = =>
        #     M_000 = [
        #         square_side, 0, 0,
        #         0, -square_side, 0,
        #         (@state.view_width / 2), (@state.view_height / 2), 1
        #     ]
        #     M: M_000

        main_div = ->
            style:
                background: 'black'
                position: 'absolute'
                width: window.innerWidth
                height: window.innerHeight
                left: 0
                right: 0
                top: 0
                bottom: 0

        if not @state?.view_width
            div main_div()
        else
            # if @state.view_width < @state.view_height
                # smaller = @state.view_width
            # else
                # smaller = @state.view_height
                # spare_side = (((@state.view_width - @state.view_height) / 2) / 200)
            # @square_side = square_side = smaller / 200
            # M = @payload_002(square_side).M
            M = @payload_003(@state.view_width)

            div main_div(),
                svg
                    width:  '100%'
                    height: '100%'
                    display: 'block'
                ,
                    widget
                        M: M




widget = rr

    componentDidMount: ->
        c 'superagent', superagent

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

    reviews_title: ->
        subj =
            font_size: 5.377
            text_width: 25.439
            x: 37.33
            y: 14.7
        origin: vec2.transformMat3 vec2.create(), [subj.x, subj.y], @state.M
        text_width: subj.text_width * @state.M[0]
        font_size: -(subj.font_size * @state.M[4])

    reviews_number: ->
        subj =
            text_width: 8.89
            font_size: 2.89
            x: 65.45
            y: 14.7
        origin: vec2.transformMat3 vec2.create(), [subj.x, subj.y], @state.M
        text_width: subj.text_width * @state.M[0]
        font_size: -(subj.font_size * @state.M[4])

    render: ->

        area_rect = @area_rect()
        top_yellow_bar_rect = @top_yellow_bar_rect()
        reviews_rect = @reviews_rect()
        reviews_title = @reviews_title()
        reviews_number = @reviews_number()
        reviews_scroller = @reviews_scroller()

        svg
            width: '100%'
            height: '100%'
        ,
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
                    when 0 then 'red'
                    when 1 then 'blue'
                    when 2 then 'lightgreen'

                rect
                    x: review_blurb_area.origin[0]
                    y: review_blurb_area.origin[1]
                    width: review_blurb_area.width
                    height: review_blurb_area.height
                    fill: temp_color







React_DOM.render main(), root

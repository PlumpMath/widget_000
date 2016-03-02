

{request, _, gl_mat, r_aj, React, React_DOM, rr, c, shortid, assign, keys, mat3, vec3, vec2} = require('./boilerplate.coffee')()

root = document.getElementById 'root'

{p, div, h1, h2, h3, h4, h5, h6, span, svg, circle, rect, ul, line, li, ol, code, a, input, defs, clipPath, linearGradient, stop, g, path, d, polygon, image, pattern, filter, feBlend, feOffset, polyline, feGaussianBlur, feMergeNode, feMerge, radialGradient, foreignObject, text, ellipse, img} = React.DOM

widget = require('./widget.coffee')

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
                # img
                #     src: '../assets/dhgicon.png'
                #     width: 100
                #     height: 100
React_DOM.render main(), root

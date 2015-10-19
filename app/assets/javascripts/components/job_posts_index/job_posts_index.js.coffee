# @cjsx React.DOM

@JobPostsIndex = React.createClass
  displayName: 'JobPostsIndex'
  jobPostCache: {}
  getInitialState: ->
    didFetchData: false
    current_post: {}
    current_post_id: @props.current_post_id
  componentDidMount: ->
    @_fetchCurrentPost({})
  _fetchCurrentPost: (data) ->
    if @jobPostCache[@state.current_post_id]
      @setState
        didFetchData: true
        current_post: @jobPostCache[@state.current_post_id]
    else
      $.ajax
        url: '/job_posts/' + @state.current_post_id
        type: 'GET'
        dataType: 'json'
      .done @_fetchCurrentPostDone
      .fail @_fetchCurrentPostFail
  _fetchCurrentPostDone: (data, textStatus, jqXHR) ->
    @jobPostCache[@state.current_post_id] = data
    @setState
      current_post: data
      didFetchData: true
  _fetchCurrentPostFail: ->
    console.log "fail to load data"
  changeCurrentPost: (id) ->
    @setState({didFetchData: false, current_post_id: id}, () -> @_fetchCurrentPost({}))
  onGoingJobPostList: ->
    <div className='ongoing_job_post_list'>
      <h4 className="subheader">Ongoing Job Posts</h4>
      <JobPostsList
        posts={@props.ongoing_posts}
        current_post_id={@state.current_post_id}
        changeCurrentPost={@changeCurrentPost}/>
    </div>
  pastJobPostList: ->
    <div className='past_job_post_list'>
      <h4 className="subheader">Past Job Posts</h4>
      <JobPostsList
        posts={@props.past_posts}
        current_post_id={@state.current_post_id}
        changeCurrentPost={@changeCurrentPost}/>
    </div>
  jobPostShow: ->
    if @state.didFetchData
      <JobPostShow post={@state.current_post} />
    else
      <div>Loading Data..</div>
  render: ->
    React.DOM.div
      className: 'job_posts_index row'
      React.DOM.div
        className: 'job_posts_list column large-4 small-4'
        if @props.ongoing_posts != null && @props.ongoing_posts.length !=0
          @onGoingJobPostList()
        if @props.past_posts != null && @props.past_posts.length !=0
          @pastJobPostList()
      React.DOM.div
        className: 'job_posts_list column large-8 small-8'
        @jobPostShow()

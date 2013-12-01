# For more information see: http://emberjs.com/guides/routing/

Ghettoblaster.Router.map ->
  @resource 'admin', path: '/admin', ->
    @resource 'subscribers', path: 'subscribers'
    @resource 'blasts', path: 'blasts'
    @resource 'users', path: 'users'
  @route 'thanks', path: '/thanks'
  @route 'form', path: ''

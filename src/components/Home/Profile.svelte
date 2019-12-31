<script>
export let user
</script>

<div id="profile">
  <img class="text-primary" src={user.avatarUrl} alt="profile picture" />
  <h3>{user.name}</h3>
  <h5 class="text-primary">{user.location}</h5>
  {user.bio}
</div>

<style>
#profile {
  margin-bottom: 3em;
  text-align: center;
}
img {
  width: 150px;
  height: 150px;
  border: solid 1px;
  border-radius: 75px;
  margin-bottom: 1.3em;
}
</style>

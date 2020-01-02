<script>
export let user
</script>

<div id="header" class="container">
  <div class="columns">
    <div class="column col-4 col-xs-1"></div>
    <div class="column col-4 col-xs-10">
      <header class="navbar">
        <section class="navbar-section">
          <a href="/" class="btn btn-link">Home</a>
          <a href={user.url} class="btn btn-link">Projects</a>
        </section>
        <section class="navbar-center">
          <!-- centered logo or brand -->
        </section>
        <section class="navbar-section">
          <a href="/" class="btn btn-link">About</a>
          <a href="/" class="btn btn-link">Contact</a>
        </section>
      </header>
    </div>
    <div class="column col-4 col-xs-1"></div>
  </div>
</div>

<style>
#header {
  margin-bottom: 2em;
}

.navbar-section {
  text-align: center;
}
</style>

<?php
    include_once('./view/header.php');
    require('./dao/site_manager.php');
    require_once './model/model.php';
    include_once './view/site/all_sites.php' ;
?>

<main class="container">
    <section>
        <div class="row">
            <div class="col s12 m12">
                <h1>Note explicative</h1>

                <p>
                    Cette page est subdivisée en 3 sections, chacune devant correspondre à une page de l'application. 
                    Malheureusement nous avons été pris par le temps et nous ne pouvons donc passer plus de temps sur la mise en page
                    et le <strong>module de routing</strong>. 
                </p>

                <p>
                    La première section récupère de la base de données la liste des différents sites de l'ASBL et expose leurs adresses.
                </p>

                <p>
                    La deuxième section est subdivisées en deux sous-sections. La première expose les données d'un site précis récupérées de la base de données;
                    et la deuxième affiche les locaux présents sur ce site avec des statistisques sur le nombre d'animaux présents dans ces locaux.
                </p>

                <h3>Post scriptum</h3>
                <p>
                    Les fichiers des scripts en annexe montrent beaucoup plus le travail fait côté <strong>base de données</strong>.
                    Nous vous prions de bien vouloir le prendre en compte pour l'effort fait dans ce sens. Merci.
                </p>
            </div>
        </div>
    </section>

    <section class="row">
        <hr />
        <section class="col s12 m8">
            <ul class="collection with-header">
                <li class="collection-header center"><h4>Liste des sites</h4></li>
                <?php
                    foreach (Site::getAll() as $key => $value) {
                ?>
                    <li class="collection-item avatar">
                        <?= $key + 1; ?>
                      <span class="title"><?= $value->name(); ?></span>
                      <p>
                        <?= $value->street(); ?>, <?= $value->locality() ?> <br />
                        <?= $value->country(); ?>
                      </p>
                      <a href="#!" class="secondary-content"><i class="material-icons"></i></a>
                    </li>

                <?php
                    }
                ?>
                </ul>
        </section>

        <aside class="col s12 m4">
            <h4>Note sur la section</h4>
            
            <p>
                Ce <strong>aside</strong> est destiné à présenter des statistiques sur la liste des sites présentée dans la section à gauche.
            </p>

            <p>
                Les statistiques concernent la répartition de la population des animaux du refuge sur chaque site. Mais comme nous l'avons mentionné
                plus haut nous ne disposons pas du temps nécessaire pour présenter ces statistiques.
            </p>

            <p>
                La section reste donc vide.
            </p>
        </aside>
    </section>


    <section class="row">
        <hr />
        <?php $boondael = Site::getAll()[1]; ?>

        <section class="col s12 m8">
            <div class="card blue-grey darken-1">
                <div class="card-content white-text">
                    <span class="card-title">Site de <?= $boondael->name(); ?></span>
                    <p>
                        <?= $boondael->street(); ?>, <?= $boondael->postal_code(); ?> (<?= $boondael->locality(); ?>) <br />
                        <?= $boondael->region(); ?>, <?= $boondael->country(); ?>
                    </p>
                </div>
                <div class="card-action">
                    <a href="#">Locaux</a>
                    <a href="#">Animaux</a>
                </div>
            </div>
        </section>

        <aside class="col s12 m4">
            <h4>Locaux du site  <?= $boondael->name(); ?></h4>
            <ul class="collapsible">
            
                <?php
                    foreach(Site::getRoomsBySite($boondael) as $key => $value) { 
                ?>

                <li>
                    <div class="collapsible-header">
                        <i class="material-icons"></i><?= $value->name(); ?>
                        <span class="new badge" data-badge-caption="animaux"><?= $value->identifier(); ?></span>
                        <div class="collapsible-body"><p><?= $value->description(); ?></p></div>
                    </li>
                       
                <?php
                    }
                ?>
            </ul>
        </aside>

  </section>
</main>

<?php include_once('./view/footer.php'); ?>
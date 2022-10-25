<?php
class Tasks extends Config {

    public function login($email, $pass) {
        $db = parent::connect();
        parent::set_names();
        $sql = "SELECT id, name, admin, pass FROM user WHERE email = ?;";
        $sql = $db->prepare($sql);
        $sql->bindValue(1, $email);
        $sql->execute();
        $query = $sql->fetch();
        // Si encuentra al usuario y la contraseña coincide entonces retorna los datos
        if ($query && password_verify($pass, $query['pass'])) {
            $result['id'] = $query['id'];
            $result['name'] = $query['name'];
            $result['admin'] = $query['admin'];
        } else {
            $result['id'] = 0;
        }
        return $result;
    }

    // Insertar un nuevo usuario
    public function insertUser($name, $email, $pass, $color, $admin) {
        $link = parent::connect();
        parent::set_names();
        // Encripta la contraseña recbidia y la manda a la BD
        $passencrypt = password_hash($pass, PASSWORD_DEFAULT);
        $sql = "CALL insertUser(?, ?, ?, ?, ?);";
        $sql = $link->prepare($sql);
        $sql->bindValue(1, $name);
        $sql->bindValue(2, $email);
        $sql->bindValue(3, $passencrypt);
        $sql->bindValue(4, $color);
        $sql->bindValue(5, $admin);
        $result['status'] = $sql->execute();
        $result['evidencia'] = $passencrypt;
        return $result;
    }

    // Obtiene sólo la vista de actividades permitidas ver para el usuario
    public function getAllowed($id) {
        $db = parent::connect();
        parent::set_names();
        $sql = "SELECT task.*, user.name FROM task JOIN userviews ON userviews.views = task.asignment JOIN user ON user.id = task.asignment WHERE user.team = (SELECT team FROM user WHERE id = ?) ORDER BY start;";
        $sql = $db->prepare($sql);
        $sql->bindValue(1, $id);
        $sql->execute();
        $results = $sql->fetchAll(PDO::FETCH_OBJ);
        $array = [];
        foreach ($results as $r) {
            $array[] = [
                'id' => $r->id,
                'title' => $r->title,
                'start' => $r->start,
                'end' => $r->end,
                'notes' => $r->notes,
                'status' => $r->status,
                'userID' => $r->asignment,
                'userName' => $r->name
            ];
        }
        return $array;
    }

    // Obtiene sólo los usuarios a los que les puede asignar tareas
    public function getUsers($id) {
        $db = parent::connect();
        parent::set_names();
        $sql = "SELECT user.* FROM user JOIN userviews ON userviews.views = user.id WHERE userviews.user = ?;";
        $sql = $db->prepare($sql);
        $sql->bindValue(1, $id);
        $sql->execute();
        $results = $sql->fetchAll(PDO::FETCH_OBJ);
        $array = [];
        foreach ($results as $r) {
            $array[] = [
                'id' => $r->id,
                'name' => $r->name,
                'email' => $r->email,
                'pass' => $r->pass,
                'color' => $r->color,
                'admin' => $r->admin
            ];
        }
        return $array;
    }

    // Obtiene a todos los usuarios de la empresa
    public function getAllUsers() {
        $db = parent::connect();
        parent::set_names();
        $sql = "SELECT * FROM user;";
        $sql = $db->prepare($sql);
        $sql->execute();
        $results = $sql->fetchAll(PDO::FETCH_OBJ);
        $array = [];
        foreach ($results as $r) {
            $array[] = [
                'id' => $r->id,
                'name' => $r->name,
                'email' => $r->email,
                'pass' => $r->pass,
                'color' => $r->color,
                'admin' => $r->admin
            ];
        }
        return $array;
    }

    // Obtiene todas las tareas de la empresa
    public function getAll() {
        $db = parent::connect();
        parent::set_names();
        $sql = "SELECT task.*, user.name FROM task JOIN user ON task.asignment = user.id ORDER BY start;";
        $sql = $db->prepare($sql);
        $sql->execute();
        $results = $sql->fetchAll(PDO::FETCH_OBJ);
        $array = [];
        foreach ($results as $r) {
            $array[] = [
                'id' => $r->id,
                'title' => $r->title,
                'start' => $r->start,
                'end' => $r->end,
                'notes' => $r->notes,
                'status' => $r->status,
                'userID' => $r->asignment,
                'userName' => $r->name
            ];
        }
        return $array;
    }

    // Obtiene las tareas de un usuario
    public function getOne($id) {
        $link = parent::connect();
        parent::set_names();
        $sql = "SELECT * FROM task JOIN user ON task.asignment = user.id WHERE id = ?;";
        $sql = $link->prepare($sql);
        $sql->bindValue(1, $id);
        $sql->execute();
        $result = $sql->fetch(PDO::FETCH_OBJ);
        // Si el result está vacío retornamos un arreglo vacío por medio una condición ternaria
        $array = $result ? [
                'id' => $result->id,
                'title' => $result->title,
                'start' => $result->start,
                'end' => $result->end,
                'notes' => $result->notes,
                'status' => $result->status,
                'userID' => $result->asignment,
                'userName' => $result->name,
        ] : [];
        return $array;
    }

    // Inserta una nueva tarea
    public function insertTask($title, $start, $end, $asignment, $notes) {
        $link = parent::connect();
        parent::set_names();
        $sql = "INSERT INTO task(title, start, end, asignment, notes) VALUES(?, ?, ?, ?, ?);";
        $sql = $link->prepare($sql);
        $sql->bindValue(1, $title);
        $sql->bindValue(2, $start);
        $sql->bindValue(3, $end);
        $sql->bindValue(4, $asignment);
        $sql->bindValue(5, $notes);
        // $lastInserId =  $link->lastInsertId();
        // if ($lastInserId != "0") {
        //     $resultado['id'] = $lastInserId;
        // }
        // $resultado['status'] =  $sql->execute();
        $result['status'] =  true;
        return $result;
    }

    // Actualiza una tarea
    public function updateTask($title, $start, $end, $status, $asignment, $notes, $id) {
        $link = parent::connect();
        parent::set_names();
        $sql = "UPDATE task SET title = ?, start = ?, end = ?, status = ?, asignment = ?, notes = ? WHERE id = ?;";
        $sql = $link->prepare($sql);
        $sql->bindValue(1, $title);
        $sql->bindValue(2, $start);
        $sql->bindValue(3, $end);
        $sql->bindValue(4, $status);
        $sql->bindValue(5, $asignment);
        $sql->bindValue(6, $notes);
        $sql->bindValue(7, $id);
        $result['status'] = $sql->execute();
        return $result;
    }

    // Para borrar una tarea
    public function deleteTask($id) {
        $link = parent::connect();
        parent::set_names();
        $sql = "DELETE FROM task WHERE id = ?;";
        $sql = $link->prepare($sql);
        $sql->bindValue(1, $id);
        $result['status'] = $sql->execute();
        return $result;
    }

    public function deleteUser($id) {
        $link = parent::connect();
        parent::set_names();
        $sql = "CALL deleteUser(?);";
        $sql = $link->prepare($sql);
        $sql->bindValue(1, $id);
        $result['status'] = $sql->execute();
        return $result;
    }

    public function editUser($name, $email, $pass, $color, $admin, $id) {
        $link = parent::connect();
        parent::set_names();
        $sql = "UPDATE user SET name = ?, email = ?, pass = ?, color = ?, admin = ? WHERE id = ?";
        $sql = $link->prepare($sql);
        $sql->bindValue(1, $name);
        $sql->bindValue(2, $email);
        $sql->bindValue(3, $pass);
        $sql->bindValue(4, $color);
        $sql->bindValue(5, $admin);
        $sql->bindValue(6, $id);
        $result['status'] = $sql->execute();
        return $result;
    } 

    public function getTeams() {
        $link = parent::connect();
        parent::set_names();
        $sql = "SELECT * FROM getTeams;";
        $sql = $link->prepare($sql);
        $sql->execute();
        $result = $sql->fetchAll(PDO::FETCH_OBJ);
        $json = array();
        foreach ($result as $data) {
            // Sólo ingresa los usuarios si el equipo tiene miembros
            $usersData = array();
            if ($data->users) {
                $users = explode('|', $data->users);
                foreach ($users as $user) {
                    $user = explode(',', $user);
                    array_push($usersData, ['id' => $user[0], 'name' => $user[1], 'email' => $user[2]]);
                }
            }
            $object = [
                'team' => $data->team,
                'tName' => $data->tName,
                'users' => $usersData
            ];
            array_push($json, $object);
        }
        return $json;
    }

    public function getTeam($idTeam) {
        $link = parent::connect();
        parent::set_names();
        $sql = "SELECT * FROM getTeams WHERE team = ?;";
        $sql = $link->prepare($sql);
        $sql->bindValue(1, $idTeam);
        $sql->execute();
        $result = $sql->fetchAll(PDO::FETCH_OBJ);
        $json = array();
        foreach ($result as $data) {
            // Sólo ingresa los usuarios si el equipo tiene miembros
            $usersData = array();
            if ($data->users) {
                $users = explode('|', $data->users);
                foreach ($users as $user) {
                    $user = explode(',', $user);
                    array_push($usersData, ['id' => $user[0], 'name' => $user[1], 'email' => $user[2]]);
                }
            }
            $object = [
                'team' => $data->team,
                'tName' => $data->tName,
                'users' => $usersData
            ];
            array_push($json, $object);
        }
        return $json;
    }

    public function getUnasigned() {
        $link = parent::connect();
        parent::set_names();
        $sql = "SELECT * FROM getUnasigned;";
        $sql = $link->prepare($sql);
        $sql->execute();
        $result = $sql->fetchAll(PDO::FETCH_OBJ);
        $json = array();
        foreach ($result as $data) {
            $usersData = array();
            $users = explode('|', $data->users);
            foreach ($users as $user) {
                $user = explode(',', $user);
                array_push($usersData, ['id' => $user[0], 'name' => $user[1], 'email' => $user[2]]);
            }
            $object = [
                'team' => '',
                'tName' => '',
                'users' => $usersData
            ];
            array_push($json, $object);
        }
        return $json;
    }

    public function addTeam($name) {
        $link = parent::connect();
        parent::set_names();
        $sql = "INSERT INTO team(name) VALUES(?);";
        $sql = $link->prepare($sql);
        $sql->bindValue(1, $name);
        return $sql->execute();
    }

    public function addToTeam($idTeam, $idUser) {
        $link = parent::connect();
        parent::set_names();
        $sql = "CALL addToTeam(?,?);";
        $sql = $link->prepare($sql);
        $sql->bindValue(1, $idTeam);
        $sql->bindValue(2, $idUser);
        return $sql->execute();
    }

    public function deleteTeam($team) {
        $link = parent::connect();
        parent::set_names();
        $sql = "DELETE FROM team WHERE id = ?;";
        $sql = $link->prepare($sql);
        $sql->bindValue(1, $team);
        return $sql->execute();
    }
}

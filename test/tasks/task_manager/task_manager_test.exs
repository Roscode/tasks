defmodule Tasks.TaskManagerTest do
  use Tasks.DataCase

  alias Tasks.TaskManager

  describe "tasks" do
    alias Tasks.TaskManager.Task

    @valid_attrs %{completed: true, desc: "some desc", name: "some name"}
    @update_attrs %{completed: false, desc: "some updated desc", name: "some updated name"}
    @invalid_attrs %{completed: nil, desc: nil, name: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TaskManager.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert TaskManager.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert TaskManager.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = TaskManager.create_task(@valid_attrs)
      assert task.completed == true
      assert task.desc == "some desc"
      assert task.name == "some name"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TaskManager.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = TaskManager.update_task(task, @update_attrs)

      
      assert task.completed == false
      assert task.desc == "some updated desc"
      assert task.name == "some updated name"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = TaskManager.update_task(task, @invalid_attrs)
      assert task == TaskManager.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = TaskManager.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> TaskManager.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = TaskManager.change_task(task)
    end
  end
end

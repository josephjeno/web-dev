defmodule Tasks1.SocialTest do
  use Tasks1.DataCase

  alias Tasks1.Social

  describe "tasks" do
    alias Tasks1.Social.Task

    @valid_attrs %{completed?: true, description: "some description", time_spent: 42, title: "some title"}
    @update_attrs %{completed?: false, description: "some updated description", time_spent: 43, title: "some updated title"}
    @invalid_attrs %{completed?: nil, description: nil, time_spent: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Social.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Social.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Social.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Social.create_task(@valid_attrs)
      assert task.completed? == true
      assert task.description == "some description"
      assert task.time_spent == 42
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Social.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.completed? == false
      assert task.description == "some updated description"
      assert task.time_spent == 43
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_task(task, @invalid_attrs)
      assert task == Social.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Social.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Social.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Social.change_task(task)
    end
  end

  describe "manages" do
    alias Tasks1.Social.Manage

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def manage_fixture(attrs \\ %{}) do
      {:ok, manage} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Social.create_manage()

      manage
    end

    test "list_manages/0 returns all manages" do
      manage = manage_fixture()
      assert Social.list_manages() == [manage]
    end

    test "get_manage!/1 returns the manage with given id" do
      manage = manage_fixture()
      assert Social.get_manage!(manage.id) == manage
    end

    test "create_manage/1 with valid data creates a manage" do
      assert {:ok, %Manage{} = manage} = Social.create_manage(@valid_attrs)
    end

    test "create_manage/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_manage(@invalid_attrs)
    end

    test "update_manage/2 with valid data updates the manage" do
      manage = manage_fixture()
      assert {:ok, manage} = Social.update_manage(manage, @update_attrs)
      assert %Manage{} = manage
    end

    test "update_manage/2 with invalid data returns error changeset" do
      manage = manage_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_manage(manage, @invalid_attrs)
      assert manage == Social.get_manage!(manage.id)
    end

    test "delete_manage/1 deletes the manage" do
      manage = manage_fixture()
      assert {:ok, %Manage{}} = Social.delete_manage(manage)
      assert_raise Ecto.NoResultsError, fn -> Social.get_manage!(manage.id) end
    end

    test "change_manage/1 returns a manage changeset" do
      manage = manage_fixture()
      assert %Ecto.Changeset{} = Social.change_manage(manage)
    end
  end

  describe "timeblocks" do
    alias Tasks1.Social.TimeBlock

    @valid_attrs %{end: ~N[2010-04-17 14:00:00.000000], start: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{end: ~N[2011-05-18 15:01:01.000000], start: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{end: nil, start: nil}

    def time_block_fixture(attrs \\ %{}) do
      {:ok, time_block} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Social.create_time_block()

      time_block
    end

    test "list_timeblocks/0 returns all timeblocks" do
      time_block = time_block_fixture()
      assert Social.list_timeblocks() == [time_block]
    end

    test "get_time_block!/1 returns the time_block with given id" do
      time_block = time_block_fixture()
      assert Social.get_time_block!(time_block.id) == time_block
    end

    test "create_time_block/1 with valid data creates a time_block" do
      assert {:ok, %TimeBlock{} = time_block} = Social.create_time_block(@valid_attrs)
      assert time_block.end == ~N[2010-04-17 14:00:00.000000]
      assert time_block.start == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_time_block/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Social.create_time_block(@invalid_attrs)
    end

    test "update_time_block/2 with valid data updates the time_block" do
      time_block = time_block_fixture()
      assert {:ok, time_block} = Social.update_time_block(time_block, @update_attrs)
      assert %TimeBlock{} = time_block
      assert time_block.end == ~N[2011-05-18 15:01:01.000000]
      assert time_block.start == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_time_block/2 with invalid data returns error changeset" do
      time_block = time_block_fixture()
      assert {:error, %Ecto.Changeset{}} = Social.update_time_block(time_block, @invalid_attrs)
      assert time_block == Social.get_time_block!(time_block.id)
    end

    test "delete_time_block/1 deletes the time_block" do
      time_block = time_block_fixture()
      assert {:ok, %TimeBlock{}} = Social.delete_time_block(time_block)
      assert_raise Ecto.NoResultsError, fn -> Social.get_time_block!(time_block.id) end
    end

    test "change_time_block/1 returns a time_block changeset" do
      time_block = time_block_fixture()
      assert %Ecto.Changeset{} = Social.change_time_block(time_block)
    end
  end
end

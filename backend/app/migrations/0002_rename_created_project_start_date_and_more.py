# Generated by Django 4.0.5 on 2022-12-08 10:05

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='project',
            old_name='created',
            new_name='start_date',
        ),
        migrations.RemoveField(
            model_name='project',
            name='updated',
        ),
        migrations.RemoveField(
            model_name='user',
            name='created',
        ),
        migrations.RemoveField(
            model_name='user',
            name='updated',
        ),
        migrations.AddField(
            model_name='project',
            name='deadline',
            field=models.DateTimeField(null=True),
        ),
        migrations.AddField(
            model_name='project',
            name='end_date',
            field=models.DateTimeField(null=True),
        ),
        migrations.CreateModel(
            name='Task',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('description', models.TextField(blank=True, null=True)),
                ('start_date', models.DateTimeField(auto_now_add=True)),
                ('end_date', models.DateTimeField(null=True)),
                ('deadline', models.DateTimeField(null=True)),
                ('project', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='app.project')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='app.user')),
            ],
        ),
    ]
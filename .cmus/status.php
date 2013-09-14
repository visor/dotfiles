#!/bin/env php
<?php

class CmusStatus {

	protected $trackStatus;

	protected $fields = array(
		'status',
		'file',
		'artist',
		'album',
		'tracknumber',
		'title',
		'date',
		'duration',
	);

	private static $playStatus = array(
		'playing' => '',
		'paused'  => '',
		'stopped' => '',
	);

	public function __construct(array $data) {
		$this->trackStatus = $this->convertToStatus($data);
		$this->prepare();
	}

	public function notify() {
		if ('playing' === $this->trackStatus['status']) {
			$title = 'Сейчас играет';
		} elseif ('paused' === $this->trackStatus['status']) {
			$title = 'На паузе';
		} elseif ('stopped' === $this->trackStatus['status']) {
			$title = 'Остановлено';
		}
		$parts = array(
			$this->trackStatus['statusIcon'],
			empty($this->trackStatus['artist']) ? 'Неизвестный исполнитель' : $this->trackStatus['artist'],
			'—',
			empty($this->trackStatus['title']) ? baseName($this->trackStatus['file']) : $this->trackStatus['title'],
		);

		$file    = $this->escape(str_replace('/data/Music/', '', $this->trackStatus['file']));
		$name    = $this->escape(implode(' ', $parts));
		$text    = $file . '<br><span font=\'Consolas,12\' color=\'#ffffff\'>' . $name. '<br /></span>';

		$message = '<span font=\'Consolas,10\'><span color=\'#FF7F00\'>' . $title . '</span><br><br>' . $text . '</span>';
		$command = 'echo "naughty.notify({ text = \"' . $message . '\", timeout = 5, hover_timeout = 1, screen = mouse.screen })" | awesome-client';
		system($command);
		system(`cmus-remote -C win-sel-cur`);
		file_put_contents(__DIR__ . '/status.msg', $message);
	}

	protected function convertToStatus(array $params) {
		$result = array();
		for ($i = 0, $count  = count($params); $i < $count; $i += 2) {
			$name = $params[$i];
			$value = $params[$i + 1];
			$result[$name] = $value;
		}
		return $result;
	}

	protected function prepare() {
		if (isSet($this->trackStatus['status'])) {
			$this->trackStatus['statusIcon'] = $this->getPlayStatus($this->trackStatus['status']);
		}
		if (isSet($this->trackStatus['duration'])) {
			$this->trackStatus['duration'] = $this->secondsToLength($this->trackStatus['duration']);
		}
	}

	protected function getPlayStatus($string) {
		if (isSet(self::$playStatus[$string])) {
			return self::$playStatus[$string];
		}
		return '?';
	}

	protected function secondsToLength($seconds) {
		$min = floor($seconds / 60);
		$sec = $seconds - (60 * $min);
		return $seconds . ' ' . $min . ':' . $sec;
	}

	protected function escape($string) {
		$result = htmlSpecialChars($string);
		return $result;
	}
}

$params = $_SERVER['argv'];
array_shift($params);
$status = new CmusStatus($params);
$status->notify();